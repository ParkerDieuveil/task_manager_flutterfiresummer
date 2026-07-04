import '../enums/priority.dart';
import 'task.dart';

class UrgentTask extends Task {
  UrgentTask({
    required super.id,
    required super.title,
    super.dueDate,
    super.completed = false,
  }) : super(
          priority: Priority.high,
        );

  @override
  String toString() {
    return "🔥 $title (${priority.label})";
  }
}