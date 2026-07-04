import 'dart:io';

import 'package:task_manager/repositories/task_repository.dart';
import 'package:task_manager/services/json_service.dart';
import 'package:task_manager/services/task_service.dart';
import 'package:task_manager/utils/menu.dart';

Future<void> main() async {
  print("====================================");
  print("      TASK MANAGER CLI");
  print("====================================");

  final jsonService = JsonService();

  final repository = TaskRepository(jsonService);

  await repository.load();

  final service = TaskService(repository);

  final menu = Menu(service);

  bool running = true;

  while (running) {
    menu.show();

    final choice = stdin.readLineSync();

    switch (choice) {
      case "1":
        await menu.addTask();
        break;

      case "2":
        await menu.displayTasks();
        break;

      case "3":
        await menu.completeTask();
        break;

      case "4":
        await menu.deleteTask();
        break;

      case "5":
        running = false;
        print("Goodbye!");
        break;

      default:
        print("Invalid choice.");
    }
  }
}