import '../exceptions/task_exception.dart';
import '../models/task.dart';
import '../repositories/repository.dart';

class TaskService {
  final Repository<Task> repository;

  TaskService(this.repository);

  Future<void> addTask(Task task) async {
    await repository.add(task);
  }

  Future<List<Task>> getTasks() async {
    return await repository.getAll();
  }

  Future<Task> getTaskById(String id) async {
    final task = await repository.findById(id);

    if (task == null) {
      throw TaskException("Task not found.");
    }

    return task;
  }

  Future<void> completeTask(String id) async {
    final task = await repository.findById(id);

    if (task == null) {
      throw TaskException("Task not found.");
    }

    task.markCompleted();

    await repository.save();
  }

  Future<void> deleteTask(String id) async {
    final task = await repository.findById(id);

    if (task == null) {
      throw TaskException("Task not found.");
    }

    await repository.remove(id);
  }

  Future<List<Task>> getTasksSortedByPriority() async {
    final tasks = await repository.getAll();

    tasks.sort(
      (a, b) => b.priority.level.compareTo(a.priority.level),
    );

    return tasks;
  }

  Future<List<Task>> getTasksSortedByDate() async {
    final tasks = await repository.getAll();

    tasks.sort((a, b) {
      if (a.dueDate == null && b.dueDate == null) {
        return 0;
      }

      if (a.dueDate == null) {
        return 1;
      }

      if (b.dueDate == null) {
        return -1;
      }

      return a.dueDate!.compareTo(b.dueDate!);
    });

    return tasks;
  }
}