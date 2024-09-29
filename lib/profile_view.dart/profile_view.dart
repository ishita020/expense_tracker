import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../login_controller.dart/login_controller.dart';

class ProfileView extends StatelessWidget {
  final LoginController loginController =
      Get.find(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'User Profile',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(height: 20),

                 
                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Obx(() {
                            return CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(
                                loginController.image.value.isNotEmpty
                                    ? loginController.image.value
                                    : 'https://via.placeholder.com/150',
                              ),
                            );
                          }),
                          const SizedBox(height: 20),
                          Obx(() => _buildProfileField(
                              'Username', loginController.username.value)),
                          const SizedBox(height: 10),
                          Obx(() => _buildProfileField(
                              'First Name', loginController.firstName.value)),
                          const SizedBox(height: 10),
                          Obx(() => _buildProfileField(
                              'Last Name', loginController.lastName.value)),
                          const SizedBox(height: 10),
                          Obx(() => _buildProfileField(
                              'Gender', loginController.gender.value)),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              loginController.isLoggedIn.value = false;
                              Get.snackbar('Logout', 'Successfully logged out');
                              Get.offNamed('/login');
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              'Logout',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileField(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$label:',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value.isNotEmpty ? value : 'N/A',
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
