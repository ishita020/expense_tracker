import 'dart:convert'; // For handling JSON
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
      false.obs; // To show a loading indicator while making API requests

  // Update this URL with your actual API endpoint
  final String loginApiUrl = 'https://dummyjson.com/auth/login';

  // API-based login function
  Future<void> login() async {
    isLoading.value = true; // Start loading

    // Create the request body
    var requestBody = {
      "username": username.value,
      "password": password.value,
    };
    print(requestBody);
    try {
      // Send POST request to the login API
      var response = await http.post(
        Uri.parse(loginApiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
        // Convert body to JSON
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
      isLoading.value = false; // Stop loading
    }
  }

  // Update the username and password on input changes
  void updateUsername(String value) {
    username.value = value;
  }

  void updatePassword(String value) {
    password.value = value;
  }
}
