import '../models/task.dart';
import '../exceptions/task_exception.dart';
import '../repositories/repository.dart';

class TaskService<T extends Task> {
  final Repository<T> repository;

  TaskService(this.repository);

  Future<void> addTask(T task) async {
    await repository.add(task);
  }

  Future<List<T>> getTasks() async {
    return repository.getAll();
  }

  Future<void> completeTask(String id) async {
    final tasks = await repository.getAll();

    final task = tasks.firstWhere(
      (t) => t.id == id,
      orElse: () => throw TaskException("Task not found"),
    );

    task.completed = true;
    await repository.save();
  }

  Future<void> deleteTask(String id) async {
    await repository.remove(id);
  }

  Future<List<T>> getTasksSortedByPriority() async {
    final tasks = List<T>.from(await repository.getAll());

    tasks.sort((a, b) => b.priority.level.compareTo(a.priority.level));

    return tasks;
  }

  Future<List<Task>> getTasksSortedByDate() async {
  final tasks = await repository.getAll();

  final sorted = List<Task>.from(tasks);

  sorted.sort((a, b) {
    if (a.dueDate == null) return 1;
    if (b.dueDate == null) return -1;
    return a.dueDate!.compareTo(b.dueDate!);
  });

  return sorted;
}
}