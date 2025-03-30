import "package:flutter/material.dart";
import "package:intl/intl.dart";

class TodoForm extends StatefulWidget {
  const TodoForm({super.key});

  @override
  State<TodoForm> createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final _titleController = TextEditingController();
  DateTime? _selectedDate;

  final formatter = DateFormat.yMd();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _pickDate() async {
    final firstDate = DateTime.now();
    final lastDate = DateTime(firstDate.year + 50, firstDate.month + 9, firstDate.day);
    final pickedDate =
        await showDatePicker(context: context, firstDate: firstDate, lastDate: lastDate);
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(label: Text("Title")),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              Text(_selectedDate == null
                  ? "Select a date"
                  : formatter.format(_selectedDate!)),
              IconButton(onPressed: _pickDate, icon: const Icon(Icons.calendar_month))
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel")),
              ElevatedButton(
                  onPressed: () {
                    // print(_titleController.text);
                  },
                  child: const Text("Add TODO"))
            ],
          )
        ],
      ),
    );
  }
}
