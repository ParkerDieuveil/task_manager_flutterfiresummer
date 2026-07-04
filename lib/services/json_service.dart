import 'dart:convert';
import 'dart:io';
import '../models/task.dart';
import '../models/urgent_task.dart';

class JsonService {
  final File file = File("data/tasks.json");

  Future<List<Task>> load() async {
    if (!await file.exists()) return [];

    final content = await file.readAsString();

    if (content.isEmpty) return [];

    final List data = jsonDecode(content);

    return data.map<Task>((e) {
      if (e['type'] == 'urgent') {
        return UrgentTask(
          id: e['id'],
          title: e['title'],
          dueDate: e['dueDate'] != null
              ? DateTime.parse(e['dueDate'])
              : null,
        );
      }

      return UrgentTask(
        id: e['id'],
        title: e['title'],
        dueDate: null,
      );
    }).toList();
  }

  Future<void> save(List<Task> tasks) async {
    final data = tasks.map((e) => e.toJson()).toList();
    await file.writeAsString(jsonEncode(data));
  }
}