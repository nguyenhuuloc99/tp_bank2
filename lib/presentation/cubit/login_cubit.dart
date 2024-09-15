import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp_bank/presentation/cubit/login_state.dart';
import 'package:tp_bank/utils/extensions.dart';

import '../../service/repository/login_repository.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginRepository loginRepository;

  LoginCubit({required this.loginRepository}) : super(LoginInitial());

  void login(String? userName, String? password) async {
    if (userName.isNullOrEmpty || password.isNullOrEmpty) {
      emit(LoginError(ErrorType.emptyField));
      return;
    }
    try {
      emit(LoginLoading(true));
      var response = await loginRepository.executeLogin(userName!, password!);
      if (response == 200) {
        emit(LoginSuccess());
      }
    } catch (e) {
      emit(LoginLoading(false));
      emit(LoginError(ErrorType.loginError));
    }
  }
}
