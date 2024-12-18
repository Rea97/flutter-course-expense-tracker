import 'package:expense_tracker/components/expenses/expense_item.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> expenses;

  const ExpensesList({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: expenses.length, itemBuilder: (context, index) {
      return ExpenseItem(expenses[index]);
    });
  }
}