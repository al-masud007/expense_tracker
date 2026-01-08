import 'package:expense_tracker/widgets/expenses_list/expenseList.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expenses.dart';
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
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpenses(
        onAddExpense: _addExpense,
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(
      () {
        _registeredExpense.add(expense);
      },
    );
  }

  void _removeExpense(Expense expense) {
    setState(
      () {
        _registeredExpense.remove(expense);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),
        actions: [
          IconButton(
            onPressed: () => _openaddExpenseOverlay(),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('Expense Tracker'),
          Expanded(
            child: Expenselist(
              expenses: _registeredExpense,
              onremoveExpense: _removeExpense,
            ),
          )
        ],
      ),
    );
  }
}
