class Task {
  final int id;
  final String title;
  final bool completed;

  const Task({
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }

  Map<String, dynamic> toJson() =>
      {'id': id, 'title': title, 'completed': completed};
}
