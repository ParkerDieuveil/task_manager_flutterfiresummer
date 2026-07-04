import 'package:test/test.dart';
import 'package:task_manager/enums/priority.dart';
import 'package:task_manager/exceptions/task_exception.dart';
import 'package:task_manager/models/basic_task.dart';
import 'package:task_manager/services/task_service.dart';

import 'fake_repository.dart';

void main() {

  group("TaskService", () {

    late TaskService service;

    setUp(() {

      service = TaskService(
        FakeRepository(),
      );

    });

    test("Create task", () async {

      await service.addTask(

        BasicTask(
          id: "1",
          title: "Flutter",
          priority: Priority.high,
        ),

      );

      expect((await service.getTasks()).length, 1);

    });

    test("Complete task", () async {

      final task = BasicTask(
        id: "2",
        title: "Exam",
        priority: Priority.medium,
      );

      await service.addTask(task);

      await service.completeTask("2");

      expect(task.completed, true);

    });

    test("Delete task", () async {

      final task = BasicTask(
        id: "3",
        title: "Delete",
        priority: Priority.low,
      );

      await service.addTask(task);

      await service.deleteTask("3");

      expect((await service.getTasks()).isEmpty, true);

    });

    test("Exception when task not found", () {

      expect(
        () => service.completeTask("100"),
        throwsA(isA<TaskException>()),
      );

    });

    test("Sort by priority", () async {

      await service.addTask(
        BasicTask(
          id: "1",
          title: "Low",
          priority: Priority.low,
        ),
      );

      await service.addTask(
        BasicTask(
          id: "2",
          title: "High",
          priority: Priority.high,
        ),
      );

      final tasks = await service.getTasksSortedByPriority();

      expect(tasks.first.priority, Priority.high);

    });

  });

}