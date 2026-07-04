import '../enums/priority.dart';
import 'task.dart';

class UrgentTask extends Task {
  UrgentTask({
    required super.id,
    required super.title,
    super.dueDate,
  }) : super(
          priority: Priority.high,
        );

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'priority': priority.name,
      'dueDate': dueDate?.toIso8601String(),
      'completed': completed,
      'type': 'urgent',
    };
  }
}