import 'package:equatable/equatable.dart';

sealed class LoginSuccessState extends Equatable {}

class LoginSuccessInitial extends LoginSuccessState {
  @override
  List<Object?> get props => [];
}

class LoginLoading extends LoginSuccessState {
  final bool isLoading;

  LoginLoading(this.isLoading);

  @override
  List<Object?> get props => [isLoading];
}

class LoginSuccess extends LoginSuccessState {
  @override
  List<Object?> get props => [];
}

class LoginError extends LoginSuccessState {
  final ErrorType errorType;

  LoginError({required this.errorType});

  @override
  List<Object?> get props => [errorType];

  LoginError copyWith({
    ErrorType? errorType,
  }) {
    return LoginError(
      errorType: errorType ?? this.errorType,
    );
  }
}

enum ErrorType { emptyField, loginError }