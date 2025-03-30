import 'package:flutter/material.dart';
import 'package:todo_app/todoform.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() {
    return _TodoState();
  }
}

class _TodoState extends State<Todo> {
  void _openform() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return const TodoForm();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Todo APP",
            textAlign: TextAlign.center,
          ),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Column(
                children: [Text("Todo 1"), Text("Todo 2")],
              ),
              FloatingActionButton(
                onPressed: _openform,
                child: const Icon(Icons.add),
              )
            ],
          ),
        ));
  }
}
