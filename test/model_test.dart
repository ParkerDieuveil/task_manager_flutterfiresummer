import 'package:test/test.dart';
import 'package:task_manager/enums/priority.dart';
import 'package:task_manager/models/basic_task.dart';
import 'package:task_manager/models/urgent_task.dart';

void main() {

  group("Task Models", () {

    test("BasicTask created", () {

      final task = BasicTask(
        id: "1",
        title: "Study",
        priority: Priority.low,
      );

      expect(task.title, "Study");
    });

    test("UrgentTask priority", () {

      final task = UrgentTask(
        id: "2",
        title: "Exam",
      );

      expect(task.priority, Priority.high);
    });

    test("Mark completed", () {

      final task = BasicTask(
        id: "3",
        title: "Code",
        priority: Priority.medium,
      );

      task.markCompleted();

      expect(task.completed, true);

    });

  });

}