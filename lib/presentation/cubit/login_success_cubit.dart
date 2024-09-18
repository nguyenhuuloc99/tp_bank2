import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tp_bank/utils/extensions.dart';
import 'package:tp_bank/utils/shared.dart';

import '../../service/repository/login_repository.dart';
import 'login_success_state_cubit.dart';

class LoginSuccessCubit extends Cubit<LoginSuccessState> {
  LoginRepository loginRepository;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginSuccessCubit({required this.loginRepository})
      : super(const LoginSuccessState());

  void login(BuildContext context) async {
    if (passwordController.text.isNullOrEmpty) {
      emit(state.copyWith(
          message: 'Tên đăng nhập hoặc mật khẩu không được để trống'));
      return;
    }
    try {
      print('-----------${SharedManager.instance.getUserName}');
      var response = await loginRepository.executeLogin(
          SharedManager.instance.getUserName(), passwordController.text);
      if (response['status'] == 200) {
        SharedManager.instance.save(userNameController.text, 'userName');
        SharedManager.instance.setUserName(response['data']['name']);
        SharedManager.instance.save(true, 'Login');
        emit(state.copyWith(message: ''));
        context.pushReplacement('/lg2');
      }
    } catch (e) {
      if (e is DioError) {
        // The server responded with a non-2xx status code
        print('Error response data: ${e.response?.data}');
        print('Error status code: ${e.response?.statusCode}');

        if (e.response?.statusCode == 500) {
          emit(state.copyWith(message: 'Tài khoản của bạn bị khoá!'));
        } else {
          emit(state.copyWith(
              message: 'Tên người dùng hoặc mật khẩu không đúng'));
        }
      } else {
        // Other errors
        print('Unexpected error: $e');
      }
    }
  }
}
