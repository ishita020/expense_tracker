import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'expense_binding/expense_binding.dart';
import 'routes/routes.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Personal Expense Tracker',
      initialRoute: '/',
      initialBinding: ExpenseBinding(),
      getPages: AppRoutes.routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
