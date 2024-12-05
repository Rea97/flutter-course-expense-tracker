import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? selectedDate;
  Category _selectedCategory = Category.leisure;

  void dispose() {
    _titleController.dispose();
    _amountController.dispose();

    super.dispose();
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    var dateFromDatePicker = await showDatePicker(
      context: context,
      firstDate: DateTime(now.year - 1, now.month, now.day),
      lastDate: now,
    );
    setState(() {
      selectedDate = dateFromDatePicker;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            autofocus: true,
            controller: _titleController,
            maxLength: 50,
            decoration: InputDecoration(label: Text('Title')),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    label: Text('Amount'),
                    prefixText: '\$ ',
                  ),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(selectedDate == null
                        ? 'Select a date'
                        : formatter.format(selectedDate!)),
                    IconButton(
                        onPressed: _presentDatePicker,
                        icon: Icon(Icons.calendar_month))
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16,),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                  items: Category.values.map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e.name.toUpperCase()),
                    ),
                  ).toList(),
                  onChanged: (value) {
                    print(value);
                    if(value == null) {
                      return;
                    }

                    setState(() {
                      _selectedCategory = value;
                    });
                  }
              ),
              Spacer(),  
              ElevatedButton(
                onPressed: () {
                  print('${_titleController.text}:${_amountController.text}');
                },
                child: Text('Save expense'),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'))
            ],
          ),
        ],
      ),
    );
  }
}
