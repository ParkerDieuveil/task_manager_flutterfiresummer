import 'task.dart';
import '../enums/priority.dart';

class BasicTask extends Task {
  BasicTask({
    required super.id,
    required super.title,
    required super.priority,
    super.dueDate,
    super.completed,
  });

  factory BasicTask.fromJson(Map<String, dynamic> json) {
    return BasicTask(
      id: json['id'],
      title: json['title'],
      priority: Priority.values.firstWhere(
        (p) => p.name == json['priority'],
      ),
      dueDate: json['dueDate'] != null
          ? DateTime.parse(json['dueDate'])
          : null,
      completed: json['completed'] ?? false,
    );
  }

  @override
Map<String, dynamic> toJson() {
  return {
    'id': id,
    'title': title,
    'priority': priority.name,
    'dueDate': dueDate?.toIso8601String(),
    'completed': completed,
    'type': 'basic',
  };
}
}