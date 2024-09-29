import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/expense_model.dart';

class ExpenseController extends GetxController {
  TextEditingController descriptionController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  String selectedCategory = "Miscellaneous";
  var expenses = <Expense>[].obs; 
  var totalAmount = 0.0.obs;
        
 void resetData(){
  descriptionController.clear();
  amountController.clear();
  selectedCategory="Miscellaneous";
  DateTime selectedDate = DateTime.now();
 }
 
  void addExpense(Expense expense) {
    expenses.add(expense);
    calculateTotal();
  }


  void editExpense(int id, Expense updatedExpense) {
    var index = expenses.indexWhere((expense) => expense.id == id);
    if (index != -1) {
      expenses[index] = updatedExpense;
      calculateTotal();
    }
  }

  
  void deleteExpense(int id) {
    expenses.removeWhere((expense) => expense.id == id);
    calculateTotal();
  }

 
  void calculateTotal() {
    totalAmount.value = expenses.fold(0, (sum, expense) => sum + expense.amount);
  }

  
  Map<String, double> getExpenseSummary() {
    var summary = <String, double>{};
    for (var expense in expenses) {
      summary.update(expense.category, (value) => value + expense.amount,
          ifAbsent: () => expense.amount);
    }
    return summary;
  }
}
