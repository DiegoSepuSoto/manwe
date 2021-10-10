part of 'login_cubit.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  final String token;
  final String refreshToken;
  final bool isEmailValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailed;
  final String error;

  const LoginState({
    required this.email,
    required this.password,
    required this.token,
    required this.refreshToken,
    required this.isEmailValid,
    required this.isSubmitting,
    required this.isSuccess,
    required this.isFailed,
    required this.error,
  });

  factory LoginState.initial() {
    return LoginState(
      email: "",
      password: "",
      token: "",
      refreshToken: "",
      isEmailValid: false,
      isSubmitting: false,
      isSuccess: false,
      isFailed: false,
      error: "error",
    );
  }

  LoginState copyWith({
    String? email,
    String? password,
    String? token,
    String? refreshToken,
    bool? isEmailValid,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailed,
    String? error,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      token: token ?? this.token,
      refreshToken: refreshToken ?? this.refreshToken,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailed: isFailed ?? this.isFailed,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
    email,
    password,
    token,
    refreshToken,
    isEmailValid,
    isSubmitting,
    isSuccess,
    isFailed,
    error,
  ];

  @override
  String toString() {
    return "LoginState(email: $email, token: $token, refreshToken: $refreshToken)";
  }
}