import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:pharma/res/app_url.dart';
import 'package:pharma/views/login/loginPage.dart';
import 'package:http/http.dart' as http;
class AuthController extends GetxController {
  final storage = FlutterSecureStorage();

  var isLoggedIn = false.obs;

  final RxBool rememberMe = false.obs;
  final RxBool isPasswordVisible = false.obs;
  final RxBool isLoading = false.obs;



  Future<void> login(String userId, String password, bool rememberMe) async {
    isLoading.value = true;

    try {
      // Make an HTTP POST request to the login endpoint
      final response = await http.post(
        Uri.parse(AppUrl.login),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'userid': userId,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = jsonDecode(response.body);

        // Check if the response indicates success
        if (responseBody['success'] == true) {
          if (rememberMe) {
            // Save credentials securely if "Remember Me" is selected
            await storage.write(key: 'userId', value: userId);
            await storage.write(key: 'password', value: password);
          } else {
            // Clear stored credentials
            await storage.deleteAll();
          }

          // Extract and store user data from the response
          final userData = responseBody['data'];
          await storage.write(key: 'userData', value: jsonEncode(userData));

          isLoggedIn.value = true;
        } else {
          throw Exception(responseBody['message'] ?? 'Login failed');
        }
      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions
      isLoggedIn.value = false;
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  Future<Map<String, String?>> getSavedCredentials() async {
    final userId = await storage.read(key: 'userId');
    final password = await storage.read(key: 'password');
    return {'userId': userId, 'password': password};
  }

  Future<Map<String, dynamic>?> getUserData() async {
    final userDataString = await storage.read(key: 'userData');
    return userDataString != null ? jsonDecode(userDataString) : null;
  }

  void logout() async {
    await storage.deleteAll();
    isLoggedIn.value = false;
    Get.offAll(() => LoginPage());
    Get.snackbar('Success...', 'Logged out successfully...!');
  }
}
