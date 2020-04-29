import 'dart:async';
import 'package:baseflutter/src/http/api_provider.dart';
import 'package:meta/meta.dart';

class BeritaProvider {
  BeritaProvider({@required this.baseUrl, @required this.apiProvider})
      : assert(apiProvider != null);

  final String baseUrl;

  ApiProvider apiProvider;

  Future<Map<String, dynamic>> getBerita() async {
    print(Uri.encodeFull(('$baseUrl/berita')));
    try {
      var response = await apiProvider.get('$baseUrl/berita');
      print(response);
      return response;
    } on Error catch (e) {
      throw Exception('Failed to load post ' + e.toString());
    }
  }
}