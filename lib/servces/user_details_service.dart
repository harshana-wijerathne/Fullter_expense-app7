import 'package:expenz/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  static Future<void> storeUserDetails(String username, String email,
      String password, String confirmPassword, BuildContext context) async {
    try {
      if (password != confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("PassWord and comfirm password do not match"),
          ),
        );
        return;
      }
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("usernmae", username);
      await prefs.setString('email', email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("User Details stored successfully"),
        ),
      );
      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return MainScreen();
            },
          ),
        );
      }
    } catch (err) {
      err.toString();
    }
  }

  static Future<bool> checkUserName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? userName = pref.getString("usernmae");
    return userName != null;
  }
}
