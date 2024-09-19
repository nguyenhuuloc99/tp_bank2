import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tp_bank/presentation/cubit/login_state.dart';
import 'package:tp_bank/utils/extensions.dart';
import 'package:tp_bank/utils/shared.dart';

import '../../service/repository/login_repository.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginRepository loginRepository;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginCubit({required this.loginRepository}) : super(LoginState());

  void login(BuildContext context) async {
    if (userNameController.text.isNullOrEmpty ||
        passwordController.text.isNullOrEmpty) {
      emit(state.copyWith(
          message: 'Tên đăng nhập hoặc mật khẩu không được để trống'));
      return;

    }
    try {
      var response = await loginRepository.executeLogin(
          userNameController.text, passwordController.text);
      if (response['status'] == 200) {
        context.pushReplacement('/lg2');
        SharedManager.instance.setUserName(response['data']['name']);
        SharedManager.instance.save(true, 'Login');
      }
    } catch (e) {
      if (e is DioError) {
        // The server responded with a non-2xx status code
        print('Error response data: ${e.response?.data}');
        print('Error status code: ${e.response?.statusCode}');

        if (e.response?.statusCode == 500) {
          emit(state.copyWith(message: ''));
          showDialogErr(context);
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

  showDialogErr(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text("Tài Khoản Đã Bị Tạm Khoá"),
            content: const Text(
                "Tài khoản đã bị tạm khoá do nhập sai thông tin đăng nhập 5 lần. Bạn vui lòng tới điểm GD/LiveBank 24/7 gần nhất hoặc liên hệ Hotline để được hỗ trợ."),
            actions: <Widget>[
              CupertinoDialogAction(
                onPressed: () {
                  context.pop();
                },
                isDefaultAction: true,
                child: const Text(
                  "Đóng",
                  style: TextStyle(
                      color: CupertinoColors.activeOrange, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              CupertinoDialogAction(
                onPressed: () {
                  context.pop();
                },
                child: const Text(
                  "Gọi ngay",
                  style: TextStyle(
                      color: CupertinoColors.activeOrange, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              )
            ],
          );
        });
  }
}
