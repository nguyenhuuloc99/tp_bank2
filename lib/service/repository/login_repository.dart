import 'package:http/http.dart';
import 'package:tp_bank/service/api_config/api_config.dart';

class LoginRepository {
  Future<Map<String, dynamic >> executeLogin(String username, String password) async {
    var response = await ApiConfig().callAPI(username, password);
    return {
      'status' : response.statusCode,
      'data' : response.data
    };
  }
}
