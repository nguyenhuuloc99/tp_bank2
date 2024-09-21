import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tp_bank/presentation/cubit/login_state.dart';
import 'package:tp_bank/utils/extensions.dart';
import 'package:tp_bank/utils/shared.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:url_launcher/url_launcher.dart';
import '../../service/repository/login_repository.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginRepository loginRepository;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginCubit({required this.loginRepository}) : super(LoginState());

  void login(BuildContext context) async {
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
        if(e.response?.statusCode == 401) {
          emit(state.copyWith(message: e.response?.data['detail']));
          return;
        }
        if (e.response?.statusCode == 500) {
          emit(state.copyWith(message: ''));
          showDialogErr(context, e.response?.data['message']);
        } else {
          emit(state.copyWith(
              message:  e.response?.data['message']));
        }
      } else {
        // Other errors
        print('Unexpected error: $e');
      }
    }
  }

  showDialogErr(BuildContext context, String message) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text("Tài Khoản Đã Bị Tạm Khoá"),
            content:  Text(message),
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
                onPressed: () async{
                  context.pop();
                  final Uri launchUri = Uri(
                    scheme: 'tel',
                    path: '1900585885',
                  );
                  await launchUrl(launchUri);
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
