import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final String? message;

  const LoginState({this.message});

  @override
  List<Object?> get props => [message];

  LoginState copyWith({
    String? message,
  }) {
    return LoginState(
      message: message ?? this.message,
    );
  }
}
