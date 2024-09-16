import 'package:equatable/equatable.dart';

sealed class LoginState extends Equatable {}

class LoginInitial extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginLoading extends LoginState {
  final bool isLoading;

  LoginLoading(this.isLoading);

  @override
  List<Object?> get props => [isLoading];
}

class LoginSuccess extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginError extends LoginState {
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
