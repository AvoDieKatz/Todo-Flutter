import 'package:flutter/material.dart';

class TaskInfoSheet extends StatefulWidget {
  const TaskInfoSheet({super.key});

  @override
  State<TaskInfoSheet> createState() => TaskInfoSheetState();
}

class TaskInfoSheetState extends State<TaskInfoSheet> {
  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return _SheetContent();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          _showModalBottomSheet(context);
        },
        child: const Text("Task Detail"),
      ),
    );
  }
}

class _SheetContent extends StatelessWidget {
  // const _SheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      child: Column(
        children: [
          const SizedBox(
            height: 60,
            child: Center(
              child: Text(
                "Task Name",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Divider(thickness: 1),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return const ListTile(
                  title: Text("Estimated"),
                  trailing: Text("12"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
