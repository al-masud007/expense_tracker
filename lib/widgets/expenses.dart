import 'package:expense_tracker/widgets/expenses_list/expenseList.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'dart:core';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpenseState();
  }
}

class _ExpenseState extends State<Expenses> {
  final List<Expense> _registeredExpense = [
    Expense(
        title: 'Flutter Course',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Cinema',
        amount: 99,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void _openaddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const Text('Show open add expense over lay'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),
        actions: [
          IconButton(
            onPressed: () {
              return _openaddExpenseOverlay();
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('Expense Tracker'),
          Expanded(
            child: Expenselist(expenses: _registeredExpense),
          )
        ],
      ),
    );
  }
}
