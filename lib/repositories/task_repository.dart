import '../models/task.dart';
import '../services/json_service.dart';
import 'repository.dart';

class TaskRepository implements Repository<Task> {
  final JsonService jsonService;
  List<Task> _tasks = [];

  TaskRepository(this.jsonService);

  @override
  Future<void> load() async {
    _tasks = await jsonService.load();
  }

  @override
  Future<void> save() async {
    await jsonService.save(_tasks);
  }

  @override
  Future<void> add(Task item) async {
    _tasks.add(item);
    await save();
  }

  @override
  Future<void> remove(String id) async {
    _tasks.removeWhere((e) => e.id == id);
    await save();
  }

  @override
  Future<List<Task>> getAll() async {
    return List<Task>.from(_tasks);
  }

  @override
  Future<Task?> findById(String id) async {
    try {
      return _tasks.firstWhere((e) => e.id == id);
    } catch (_) {
      return null;
    }
  }
}