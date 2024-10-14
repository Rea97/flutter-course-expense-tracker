import 'package:expense_tracker/components/expenses/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'flutter course',
      date: DateTime.now(),
      amount: 19.99,
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      date: DateTime.now(),
      amount: 5.99,
      category: Category.leisure,
    ),
    Expense(
      title: 'Europe travel flight',
      date: DateTime.now(),
      amount: 499.99,
      category: Category.travel,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('The charts'),
          Expanded(child: ExpensesList(expenses: _registeredExpenses))
        ],
      ),
    );
  }
}
