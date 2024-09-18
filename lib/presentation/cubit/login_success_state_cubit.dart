import 'package:equatable/equatable.dart';

class LoginSuccessState extends Equatable {
  final String? message;

  const LoginSuccessState({this.message});

  @override
  List<Object?> get props => [message];

  LoginSuccessState copyWith({
    String? message,
  }) {
    return LoginSuccessState(
      message: message ?? this.message,
    );
  }
}
