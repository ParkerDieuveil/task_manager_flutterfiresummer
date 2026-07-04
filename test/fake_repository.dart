import 'package:task_manager/models/task.dart';
import 'package:task_manager/repositories/repository.dart';

class FakeRepository implements Repository<Task> {
  final List<Task> _tasks = [];

  @override
  Future<void> add(Task item) async {
    _tasks.add(item);
  }

  @override
  Future<void> remove(String id) async {
    _tasks.removeWhere((e) => e.id == id);
  }

  @override
  Future<List<Task>> getAll() async {
    return _tasks;
  }

  @override
  Future<Task?> findById(String id) async {
    try {
      return _tasks.firstWhere((e) => e.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> save() async {}

  @override
  Future<void> load() async {}
}