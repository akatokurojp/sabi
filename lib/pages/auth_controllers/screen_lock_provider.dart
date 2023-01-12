import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:sabi/drawer.dart';
import 'dart:io';

import '../SignUp-SignIn-Forgot/login_page.dart';
import 'db_provider.dart';

class ScreenLock {
  BuildContext? ctx;
  ScreenLock({this.ctx});

  LocalAuthentication localAuth = LocalAuthentication();
  void authenticateUser({String? path, bool? value}) async {
    bool canCheckBiometrics = await localAuth.canCheckBiometrics;

    if (canCheckBiometrics == true) {
      List<BiometricType> availableBiometrics =
          await localAuth.getAvailableBiometrics();

      if (Platform.isAndroid) {
        if (availableBiometrics.contains(BiometricType.face)) {
          // Face id
        } else if (availableBiometrics.contains(BiometricType.fingerprint)) {
          bool didAuthenticate = await localAuth.authenticate(
              localizedReason: 'Please authenticate to accces Sabi');

          if (path == 'splash') {
            if (didAuthenticate == true) {
              //Successs
              Navigator.pushReplacement(ctx!,
                  MaterialPageRoute(builder: ((context) => const HomePage())));
              //Save
            } else {
              //Close App
              SystemNavigator.pop();
            }
          } else {
            if (didAuthenticate == true) {
              //Save auth state
              DbProvider().saveAuthState(value!);
            }
          }
        }
      } else {
        if (availableBiometrics.contains(BiometricType.face)) {
          //Face Id
        } else if (availableBiometrics.contains(BiometricType.fingerprint)) {
          //Touch Id
        }
      }
    } else {
      // DO pin code
    }
  }
}
