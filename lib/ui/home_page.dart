import 'package:flutter/material.dart';
import 'package:todo_app/widgets/task_info_sheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            height: 520,
            margin: const EdgeInsets.all(16),
            child: const Center(
              child: Text(
                'TIMER HERE',
              ),
            ),
          ),
        ),
        const TaskInfoSheet()
        // const TodoList()
      ],
    );
  }
}

class AddButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
