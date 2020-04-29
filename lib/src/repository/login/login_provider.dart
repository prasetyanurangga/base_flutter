import 'dart:async';
import 'dart:convert';

import 'package:baseflutter/src/http/api_provider.dart';
import 'package:meta/meta.dart';

class LoginProvider {
  LoginProvider({@required this.baseUrl, @required this.apiProvider})
      : assert(apiProvider != null);

  final String baseUrl;

  ApiProvider apiProvider;

  Future<Map<String, dynamic>> login(String email, String password) async {
    print(Uri.encodeFull(('$baseUrl/users')));
    try {
      final String data = json.encode({'email': email, 'password': password});
      var response = await apiProvider.get('$baseUrl/users');
      return response;
    } on Error catch (e) {
      throw Exception('Failed to load post ' + e.toString());
    }
  }
}