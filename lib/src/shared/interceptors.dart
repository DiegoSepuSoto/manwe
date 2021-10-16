import 'package:dio/dio.dart';

import 'package:manwe/src/shared/user_preferences.dart';

InterceptorsWrapper unauthorizedInterceptor(Dio dioClient) {
  return new InterceptorsWrapper(onError: (DioError error, handler) {
    if (error.response?.statusCode == 401) {
      final options = error.response!.requestOptions;
      dioClient.lock();
      dioClient.interceptors.responseLock.lock();
      dioClient.interceptors.errorLock.lock();
      UserPreferences.getUpdatedToken().whenComplete(() {
        dioClient.unlock();
        dioClient.interceptors.responseLock.unlock();
        dioClient.interceptors.errorLock.unlock();
      }).then(
            (updatedToken) {
          options.headers["Authorization"] = "Bearer $updatedToken";
          dioClient.fetch(options).then(
                (r) => handler.resolve(r),
            onError: (e) {
              handler.reject(e);
            },
          );
        },
        onError: (e) {
          handler.reject(e);
        },
      );

      return;
    }
    return handler.next(error);
  });
}
