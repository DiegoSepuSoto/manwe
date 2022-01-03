import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manwe/src/data/repositories/notification_repository.dart';
import 'package:manwe/src/domain/blocs/notification/notification_screen_cubit.dart';
import 'package:manwe/src/ui/shared/components/error_screen.dart';
import 'package:manwe/src/ui/shared/components/loading_cube.dart';
import 'package:manwe/src/ui/utils/constants.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen();

  @override
  Widget build(BuildContext context) {
    final notificationRepository = new NotificationRepository();
    final Size size = MediaQuery
        .of(context)
        .size;

    return BlocProvider(
      create: (context) =>
      NotificationScreenCubit(notificationRepository: notificationRepository)
        ..notificationScreenStarted(),
      child: BlocBuilder<NotificationScreenCubit, NotificationScreenState>(
        builder: (context, state) {
          if (state is NotificationScreenLoading) {
            return LoadingCube();
          } else if (state is NotificationScreenSuccessLoad) {
            return Column(
              children: [
                Container(
                  height: size.height - 300.0,
                  child: Center(
                    child: Text(
                      'Pronto...',
                      style: TextStyle(
                          fontSize: 25.0,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                )
              ],
            );
          } else {
            return ErrorScreen();
          }
        },
      ),
    );
  }
}
