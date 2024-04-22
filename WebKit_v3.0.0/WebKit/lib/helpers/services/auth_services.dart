import 'package:webkit/models/user.dart';

import '../storage/local_storage.dart';

class AuthService {
  static bool isLoggedIn = false;

  static User get dummyUser =>
      User(-1, "webkit@getappui.com", "Denish", "Navadiya");

  static Future<Map<String, String>?> loginUser(
      Map<String, dynamic> data) async {
    await Future.delayed(Duration(seconds: 1));
    if (data['email'] != dummyUser.email) {
      return {"email": "This email is not registered"};
    } else if (data['password'] != "1234567") {
      return {"password": "Password is incorrect"};
    }

    isLoggedIn = true;
    await LocalStorage.setLoggedInUser(true);
    return null;
  }
}
