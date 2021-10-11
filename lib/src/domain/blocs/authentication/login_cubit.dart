import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:manwe/src/domain/repositories/abstract_authentication_repository.dart';
import 'package:manwe/src/shared/user_preferences.dart';
import 'package:manwe/src/ui/utils/validators.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  AbstractAuthenticationRepository authenticationRepository;

  LoginCubit({required this.authenticationRepository})
      : super(LoginState.initial());

  void emailChanged({required String email}) {
    emit(state.copyWith(email: email, isEmailValid: IsEmailValid(email)));
  }

  void passwordChanged({required String password}) {
    emit(state.copyWith(password: password));
  }

  void loginStarted() async {
    emit(state.copyWith(isSubmitting: true));
    try {
      final user =
          await authenticationRepository.logIn(state.email, state.password);

      UserPreferences.setUserInfo(user);

      emit(state.copyWith(
        token: user.token,
        refreshToken: user.refreshToken,
        isSubmitting: false,
        isSuccess: true,
        isFailed: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        isSubmitting: false,
        isSuccess: false,
        isFailed: true,
        error: e.toString(),
      ));
    }
  }
}
