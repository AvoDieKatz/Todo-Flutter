import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todo_app/models/task.dart';

Future<List<Task>> fetchTasks() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

  if (response.statusCode == 200) {
    final jsonList = jsonDecode(response.body) as List;
    List<Task> taskList =
        jsonList.map((taskJson) => Task.fromJson(taskJson)).toList();
    return taskList;
  } else {
    throw Exception("Failed to load tasks");
  }
}

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> with TickerProviderStateMixin {
  late Future<List<Task>> tasks;

  @override
  void initState() {
    super.initState();
    tasks = fetchTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
            future: tasks,
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final obj = snapshot.data![index];
                          return ListTile(
                            title: Text(obj.title),
                            subtitle: Text(obj.id.toString()),
                            trailing: obj.completed
                                ? const Icon(
                                    Icons.check_circle_outline_outlined)
                                : const Icon(Icons.circle_outlined),
                          );
                        }));
              } else if (snapshot.hasError) {
                return const Text(
                    'There is an an error while loading task detail');
              }
              return const CircularProgressIndicator();
            })),
      ],
    );
  }
}
