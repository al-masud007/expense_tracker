import 'package:flutter/material.dart';

class NewExpenses extends StatefulWidget {
  const NewExpenses({super.key});

  @override
  State<NewExpenses> createState() => _NewExpensesState();
}

// var _inputedTitle = '';

// void _saveInputTitle(String inputValue) {
//   _inputedTitle = inputValue;
// }

class _NewExpensesState extends State<NewExpenses> {
  final _titleController = TextEditingController();
  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            // onChanged:
            //  _saveInputTitle,
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  print(
                      // _inputedTitle
                      _titleController.text);
                },
                child: const Text('Save Expense😊'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
