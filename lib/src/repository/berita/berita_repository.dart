
import 'package:baseflutter/src/constant/env.dart';
import 'package:baseflutter/src/http/api_provider.dart';
import 'package:baseflutter/src/http/response_data.dart';
import 'package:baseflutter/src/model/berita_model.dart';
import 'package:baseflutter/src/model/login_response_model.dart';
import 'package:baseflutter/src/repository/berita/berita_provider.dart';
import 'package:baseflutter/src/repository/login/login_provider.dart';
import 'package:baseflutter/src/utils/internet_check.dart';
import 'package:meta/meta.dart';


class BeritaRepository {
  final ApiProvider apiProvider;
  BeritaProvider beritaProvider;
  InternetCheck internetCheck;
  Env env;

  BeritaRepository(
      {@required this.env,
        @required this.apiProvider,
        @required this.internetCheck}) {
    beritaProvider =
        BeritaProvider(baseUrl: env.baseUrl, apiProvider: apiProvider);
  }

  Future<ResponseData<BeritaModel>> getBeritas() async {
    print("ffff");
    Map<String,dynamic> response = await beritaProvider.getBerita();
    BeritaModel beritaModel = BeritaModel.fromJson(response);
    if (beritaModel == null) {
      return ResponseData.connectivityError();
    }
    if (beritaModel.success == 'berhasil') {
      return ResponseData.success(beritaModel);
    } else {
      return ResponseData.error("Error");
    }
  }
}