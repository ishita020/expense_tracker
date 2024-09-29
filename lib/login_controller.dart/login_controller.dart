import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  var isLoggedIn = false.obs;
  var username = ''.obs;
  var email = ''.obs;
  var firstName = ''.obs;
  var lastName = ''.obs;
  var gender = ''.obs;
  var image = ''.obs;
  var accessToken = ''.obs;
  var refreshToken = ''.obs;
  var password = ''.obs;
  var isLoading =
      false.obs; 

  final String loginApiUrl = 'https://dummyjson.com/auth/login';

  Future<void> login() async {
    isLoading.value = true; 

    var requestBody = {
      "username": username.value,
      "password": password.value,
    };
    print(requestBody);
    try {
      var response = await http.post(
        Uri.parse(loginApiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
       
        username.value = data['username'];
        
        email.value = data['email'];
        firstName.value = data['firstName'];
        print(firstName.value);
        lastName.value = data['lastName'];
        gender.value = data['gender'];
        print(gender.value);
        image.value = data['image'];
        print(image.value);
        accessToken.value = data['accessToken'];
        refreshToken.value = data['refreshToken'];
        isLoggedIn.value = true;
        Get.snackbar('Login Success', 'Welcome, ${username.value}!');
        Get.offNamed('/homePage'); 
      } else {
        Get.snackbar('Error', 'Failed to connect to the server');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred during login');
    } finally {
      isLoading.value = false; 
    }
  }

  void updateUsername(String value) {
    username.value = value;
  }

  void updatePassword(String value) {
    password.value = value;
  }
}
