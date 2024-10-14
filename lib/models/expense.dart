import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { food, travel, leisure, work }

final categoryIcon = {
  Category.food: Icons.launch,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

final formatter = DateFormat.yMd();

class Expense {
  final String id;

  final String title;

  final DateTime date;

  final double amount;

  final Category category;

  Expense({
    required this.title,
    required this.date,
    required this.amount,
    required this.category
  }): id = uuid.v4();

  String get formattedDate {
    return formatter.format(date);
  }

  IconData? get icon {
    return categoryIcon[category];
  }
}