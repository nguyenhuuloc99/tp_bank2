import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp_bank/presentation/cubit/login_cubit.dart';
import 'package:tp_bank/presentation/cubit/login_success_cubit.dart';
import 'package:tp_bank/router/router.dart';
import 'package:tp_bank/service/api_config/api_config.dart';
import 'package:tp_bank/service/repository/login_repository.dart';
import 'package:tp_bank/utils/shared.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ApiConfig();
  SharedManager();
  await SharedManager.init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xFF7B35BB), // navigation bar color
    statusBarColor: Color(0xFF7B35BB), // status bar color
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => LoginRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                LoginCubit(loginRepository: context.read<LoginRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                LoginSuccessCubit(loginRepository: context.read<LoginRepository>()),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        ),
      ),
    );
  }
}
