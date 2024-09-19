import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tp_bank/utils/extensions.dart';
import 'package:tp_bank/utils/shared.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:url_launcher/url_launcher.dart';

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
                      color: CupertinoColors.activeOrange, fontSize: 16),
                ),
              ),
              CupertinoDialogAction(
                onPressed: () async{
                  final Uri launchUri = Uri(
                    scheme: 'tel',
                    path: '1900585885',
                  );
                  await launchUrl(launchUri);
                },
                child: const Text(
                  "Gọi ngay",
                  style: TextStyle(
                      color: CupertinoColors.activeOrange, fontSize: 16),
                ),
              )
            ],
          );
        });
  }
}
