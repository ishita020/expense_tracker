// lib/binding/expense_binding.dart
import 'package:get/get.dart';
import '../expense_controller/expense_controller.dart';


class ExpenseBinding extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut(() => ExpenseController(),);
  }
}
