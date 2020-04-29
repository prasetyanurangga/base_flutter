
import 'package:baseflutter/src/constant/env.dart';
import 'package:baseflutter/src/http/api_provider.dart';
import 'package:baseflutter/src/http/response_data.dart';
import 'package:baseflutter/src/model/login_response_model.dart';
import 'package:baseflutter/src/repository/login/login_provider.dart';
import 'package:baseflutter/src/utils/internet_check.dart';
import 'package:meta/meta.dart';


class LoginRepository {
  final ApiProvider apiProvider;
  LoginProvider loginProvider;
  InternetCheck internetCheck;
  Env env;

  LoginRepository(
      {@required this.env,
        @required this.apiProvider,
        @required this.internetCheck}) {
    loginProvider =
        LoginProvider(baseUrl: env.baseUrl, apiProvider: apiProvider);
  }

  Future<ResponseData<LoginResponseModel>> logins(String email, String password) async {
    Map<String,dynamic> response = await loginProvider.login(email, password);
    LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(response);
    if (loginResponseModel == null) {
      return ResponseData.connectivityError();
    }
    if (loginResponseModel.success == 'berhasil') {
      return ResponseData.success(loginResponseModel);
    } else {
      return ResponseData.error("Error");
    }
  }
}