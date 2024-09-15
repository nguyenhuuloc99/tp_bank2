import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tp_bank/presentation/cubit/login_cubit.dart';
import 'package:tp_bank/presentation/page/login_page/login_page.dart';
import 'package:tp_bank/service/repository/login_repository.dart';

import '../presentation/page/login_page/login_page_success.dart';

final router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return RepositoryProvider(
          create: (context) => LoginRepository(),
          child: BlocProvider(
            create: (context) =>
                LoginCubit(loginRepository: context.read<LoginRepository>()),
            child: const LoginScreen(),
          ),
        );
      },
      routes: <RouteBase>[
        GoRoute(
            path: '/loginSuccess',
            builder: (context, state) {
              return const LoginPageSuccess();
            })
      ],
    ),
  ],
);
