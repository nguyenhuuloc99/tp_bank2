import 'package:tp_bank/service/api_config/api_config.dart';

class LoginRepository {
  Future<int?> executeLogin(String username, String password) async {
    var response = await ApiConfig().callAPI(username, password);
    return response.statusCode;
  }
}
