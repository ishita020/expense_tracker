import 'package:get/get.dart';

import '../expenses_view/add_expenses.dart';
import '../expenses_view/expense.dart';
import '../profile_view.dart/profile_view.dart';

class HomepageController extends GetxController {
  var selectedIndex = 0.obs;
  var screens = [ExpenseView(), AddExpenseView(), ProfileView()].obs;
  var screenTitles = ["Home", "Add Expenses", "Profile"].obs;
}
