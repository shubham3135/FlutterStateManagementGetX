import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';

class HomeController extends GetxController {
  var _localAuth = LocalAuthentication();
  var hasFingerPrintLock = false.obs;
  var hasFaceLock = false.obs;
  var isUserAuthenticated = false.obs;

  void _getAllBiometrics() async {
    bool hasLocalAuthentication = await _localAuth.canCheckBiometrics;
    if (hasLocalAuthentication) {
      List<BiometricType> availableBiometrics =
          await _localAuth.getAvailableBiometrics();
      hasFaceLock.value = availableBiometrics.contains(BiometricType.face);
      hasFingerPrintLock.value =
          availableBiometrics.contains(BiometricType.fingerprint);
    } else {
      showSnackBar(
          title: 'Error',
          message: 'Local Authentication not available',
          backgroundColor: Colors.red);
    }
  }

  void showSnackBar(
      {required String title,
      required String message,
      required Color backgroundColor}) {
    Get.snackbar(title, message,
        backgroundColor: backgroundColor,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM);
  }

  @override
  void onInit() {
    super.onInit();
    _getAllBiometrics();
  }

  void authenticateUser() async {
    try {
      var androidMessage = AndroidAuthMessages(
          cancelButton: 'Cancel',
          goToSettingsButton: 'settings',
          goToSettingsDescription: 'Please set up your Fingerprint/Face.',
          biometricHint: 'Verify your identity');
      isUserAuthenticated.value = await _localAuth.authenticate(
        localizedReason: 'Authenticate Yourself',
        biometricOnly: true,
        useErrorDialogs: true,
        stickyAuth: true,
        androidAuthStrings: androidMessage,
      );

      if (isUserAuthenticated.value) {
        showSnackBar(
            title: 'Success',
            message: 'You are authenticated',
            backgroundColor: Colors.green);
      } else {
        showSnackBar(
            title: 'Error',
            message: 'Authentication Cancelled',
            backgroundColor: Colors.red);
      }
    } catch (e) {
      showSnackBar(
          title: 'Error', message: e.toString(), backgroundColor: Colors.red);
    }
  }
}
