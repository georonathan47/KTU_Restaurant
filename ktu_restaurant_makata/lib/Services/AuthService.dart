// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ktu_restaurant_makata/Index.dart';
import 'package:ktu_restaurant_makata/Services/Path.dart';
import 'package:ktu_restaurant_makata/Services/SharedPrefs.dart';
import 'package:ktu_restaurant_makata/Util/Utility.dart';

import '../Util/NetworkUtility.dart';

class AuthService {
  final HelperFunctions sharedPrefs = HelperFunctions();
  // Logout
  static Future<void> logout(BuildContext context) async {
    // Remove the user from the local storage
    // await StorageService.removeUser();
    // Navigate back to the login screen
    try {
      Map<String, dynamic> userMap = {};
      Response response = await NetworkUtility().postData(LOGOUT_URL, userMap);
      debugPrint(response.body);
      if (response.statusCode == 200) {
        await HelperFunctions.saveUserLoggedInState(false).then(
          (value) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Index(),
            ),
          ),
        );
        UtilityService().showMessage(
          context: context,
          message: 'Logout Successful!',
          icon: const Icon(Icons.check),
        );
      }
    } catch (e) {
      if (e.toString() == 'SocketException: Connection refused') {
        UtilityService().showMessage(
          context: context,
          message: 'No Internet Connection!',
          icon: const Icon(Icons.error),
        );
      } else if (e.toString() == 'SocketException: Connection closed') {
        UtilityService().showMessage(
          context: context,
          message: 'Something went wrong!',
          icon: const Icon(Icons.error),
        );
      } else {
        UtilityService().showException(
          context: context,
          message: 'Unable to logout at the moment.\nPlease try again later.',
          icon: const Icon(Icons.error_outline),
        );
      }
      Navigator.pop(context);
    }
  }
}
