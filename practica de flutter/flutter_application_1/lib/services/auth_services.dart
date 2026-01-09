import 'package:flutter_application_1/models/auth.dart';

class AuthService {
  static const String username = 'admin';
  static const String password = 'admin123';

  Future<Auth> login(String username, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    if (username == username && password == password) {
      return Auth(token: 'token');
    } else {
      throw Exception('Usuario o contraseña incorrectos');
    }
  }
}
