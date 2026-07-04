import 'dart:convert';
import 'dart:io';

import '../exceptions/task_exception.dart';
import '../models/basic_task.dart';
import '../models/task.dart';

class JsonService {
  final File file = File("data/tasks.json");

  Future<List<Task>> load() async {
    try {
      if (!await file.exists()) {
        await file.create(recursive: true);
        await file.writeAsString("[]");
      }

      final jsonString = await file.readAsString();

      if (jsonString.trim().isEmpty) {
        return [];
      }

      final List<dynamic> data = jsonDecode(jsonString);

      return List<Task>.from(
            data.map((e) => BasicTask.fromJson(e)),
          );
    } on FormatException {
      throw TaskException("Le fichier JSON est invalide.");
    } on IOException {
      throw TaskException("Impossible de lire le fichier.");
    }
  }

  Future<void> save(List<Task> tasks) async {
    try {
      final json =
          tasks.map((e) => e.toJson()).toList();

      await file.writeAsString(
        const JsonEncoder.withIndent("  ").convert(json),
      );
    } on IOException {
      throw TaskException("Impossible d'enregistrer les tâches.");
    }
  }
}