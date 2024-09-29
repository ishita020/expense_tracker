// lib/binding/expense_binding.dart
import 'package:get/get.dart';
import '../login_controller.dart/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut(() =>LoginController(),);
  }
}
