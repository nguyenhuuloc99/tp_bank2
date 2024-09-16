import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp_bank/presentation/cubit/login_state.dart';
import 'package:tp_bank/utils/extensions.dart';
import 'package:tp_bank/utils/shared.dart';

import '../../service/repository/login_repository.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginRepository loginRepository;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginCubit({required this.loginRepository}) : super(LoginInitial());

  void login() async {
    if (userNameController.text.isNullOrEmpty ||
        passwordController.text.isNullOrEmpty) {
      emit(LoginError(errorType: ErrorType.emptyField));
      return;
    }
    try {
      emit(LoginLoading(true));
      var response = await loginRepository.executeLogin(
          userNameController.text, passwordController.text);
      if (response == 200) {
        emit(LoginSuccess());
        SharedManager.instance.save(true, 'Login');
      }
    } catch (e) {
      emit(LoginLoading(false));
      emit(LoginError(errorType: ErrorType.loginError));
    }
  }
}
