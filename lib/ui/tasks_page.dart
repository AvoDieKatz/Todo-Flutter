import 'package:flutter/material.dart';
import 'package:todo_app/widgets/todo_list.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const TodoList();
  }
}