import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/user.dart';
import '../environment/env.dart' as env;

///Documentation for https://firebase.google.com/docs/reference/rest/auth/
///get API key from Project Overview > Settings > Web API Key
class Authenticator {
  Future<User> authenticate(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };
    var host = env.authConfig['authHost'];
    var apiKey = env.authConfig['apiKey'];
    http.Response response = await http.post(
      '${host}/identitytoolkit/v3/relyingparty/verifyPassword?key=${apiKey}',
      body: json.encode(authData),
      headers: {'Content-Type': 'application/json'},
    );

    final Map<String, dynamic> responseData = json.decode(response.body);
    User authenticatedUser;
    if (responseData.containsKey('idToken')) {
      authenticatedUser = User.withtoken(
          id: responseData['localId'],
          email: email,
          idToken: responseData['idToken']);
      final DateTime now = DateTime.now();
      final DateTime expiryTime =
          now.add(Duration(seconds: int.parse(responseData['expiresIn'])));

      authenticatedUser.tokenExpiryTime = expiryTime;
      authenticatedUser.refreshToken = responseData['refreshToken'];
    } else if (responseData['error']['message'] == 'EMAIL_EXISTS') {
      throw Exception('This email already exists.');
    } else if (responseData['error']['message'] == 'EMAIL_NOT_FOUND') {
      throw Exception('This email was not found.');
    } else if (responseData['error']['message'] == 'INVALID_PASSWORD') {
      throw Exception('The password is invalid.');
    }
    return authenticatedUser;
  }
}
