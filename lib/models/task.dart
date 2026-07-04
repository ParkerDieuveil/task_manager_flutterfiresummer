import '../enums/priority.dart';

abstract class Task {
  final String id;
  String title;
  Priority priority;
  DateTime? dueDate;
  bool completed;

  Task({
    required this.id,
    required this.title,
    required this.priority,
    this.dueDate,
    this.completed = false,
  });

  void markCompleted() {
    completed = true;
  }

  Map<String, dynamic> toJson();
}