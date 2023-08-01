import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todo_app/models/task.dart';

Future<Task> fetchTask(int id) async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/$id'));

  if (response.statusCode == 200) {
    return Task.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load task $id');
  }
}

class TaskInfoDrawer extends StatefulWidget {
  const TaskInfoDrawer({super.key});

  @override
  State<TaskInfoDrawer> createState() => _TaskInfoDrawerState();
}

class _TaskInfoDrawerState extends State<TaskInfoDrawer> {
  late Future<Task> futureTask;

  @override
  void initState() {
    super.initState();
    futureTask = fetchTask(1);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: Container(
        color: Theme.of(context).colorScheme.secondary,
        width: width,
        height: height / 6 + 75,
        child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
            child: FutureBuilder(
              future: futureTask,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final data = snapshot.data!;

                  return Column(children: [
                    const Icon(Icons.drag_handle,
                        size: 20, color: Colors.white),
                    Text(
                      "Task Detail",
                      style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.onSecondary),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                        child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Title:  ${data.title}",
                            style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onSecondary)),
                        Text("Estimated time:  ${data.id.toString()}",
                            style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onSecondary)),
                      ],
                    ))
                  ]);
                } else if (snapshot.hasError) {
                  return const Text(
                      'There is an an error while loading task detail');
                }
                return const CircularProgressIndicator();
              },
            )),
      ),
    );
  }
}
