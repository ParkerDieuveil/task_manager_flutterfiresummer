import 'package:test/test.dart';
import 'package:task_manager/enums/priority.dart';
import 'package:task_manager/models/basic_task.dart';

import 'fake_repository.dart';

void main() {

  group("Repository", () {

    test("Add task", () async {

      final repo = FakeRepository();

      await repo.add(
        BasicTask(
          id: "1",
          title: "Task",
          priority: Priority.low,
        ),
      );

      expect((await repo.getAll()).length, 1);

    });

    test("Find task", () async {

      final repo = FakeRepository();

      final task = BasicTask(
        id: "2",
        title: "Math",
        priority: Priority.medium,
      );

      await repo.add(task);

      expect(await repo.findById("2"), task);

    });

    test("Delete task", () async {

      final repo = FakeRepository();

      await repo.add(
        BasicTask(
          id: "3",
          title: "Delete",
          priority: Priority.low,
        ),
      );

      await repo.remove("3");

      expect((await repo.getAll()).isEmpty, true);

    });

  });

  test("Repository isolation test", () async {
  final repo = FakeRepository();

  await repo.add(
    BasicTask(
      id: "1",
      title: "Test",
      priority: Priority.low,
    ),
  );

  expect(await repo.getAll(), isNotEmpty);
});

test("FindById returns null when missing", () async {
  final repo = FakeRepository();

  final result = await repo.findById("404");

  expect(result, isNull);
});

test("Repository starts empty", () async {
  final repo = FakeRepository();

  expect(await repo.getAll(), isEmpty);
});

}