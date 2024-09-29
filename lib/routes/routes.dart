import 'package:get/get.dart';


import '../Login_view/login_view.dart';
import '../expenses_view/add_expenses.dart';
import '../expenses_view/expense.dart';
import '../homepage_view/homepage_view.dart';

class AppRoutes {
  static List<GetPage<dynamic>> routes = [
    GetPage(name: '/', page: () => LoginPage()),
    GetPage(name: '/homePage', page: () => HomePage()),
    GetPage(name: '/expenseView', page: () => ExpenseView()),
    GetPage(name: '/addExpense', page: () => AddExpenseView()),
  ];
}
