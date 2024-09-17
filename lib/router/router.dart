import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:tp_bank/presentation/page/login_page/login_page.dart';
import 'package:tp_bank/presentation/page/login_page/login_success2.dart';
import 'package:tp_bank/utils/shared.dart';

import '../presentation/page/login_page/login_page_success.dart';

final router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return SharedManager.instance.getLogin() == true
            ? const LoginPageSuccess()
            : const LoginScreen();
      },
      routes: <RouteBase>[
        GoRoute(
            path: 'loginSuccess',
            builder: (context, state) {
              return const LoginPageSuccess();
            }),
        GoRoute(
            path: 'lg2',
            builder: (context, state) {
              return const LoginSuccess2();
            }),
      ],
    ),
  ],
);
