import 'dart:io';

import 'package:uuid/uuid.dart';

import '../enums/priority.dart';
import '../exceptions/task_exception.dart';
import '../models/basic_task.dart';
import '../models/task.dart';
import '../models/urgent_task.dart';
import '../services/task_service.dart';

class Menu {
  final TaskService service;

  Menu(this.service);

  void show() {
    print("\n========== TASK MANAGER ==========");
    print("1. Add Task");
    print("2. List Tasks");
    print("3. Complete Task");
    print("4. Delete Task");
    print("5. Exit");
    stdout.write("Choice: ");
  }

  Future<void> addTask() async {
    try {
      stdout.write("Title: ");
      final title = stdin.readLineSync();

      if (title == null || title.trim().isEmpty) {
        throw TaskException("Title cannot be empty.");
      }

      stdout.write("Priority (low/medium/high): ");
      final priorityInput = stdin.readLineSync() ?? "low";

      stdout.write("Due date (yyyy-mm-dd) or empty: ");
      final dueInput = stdin.readLineSync();

      DateTime? dueDate;

      if (dueInput != null && dueInput.trim().isNotEmpty) {
        dueDate = DateTime.parse(dueInput);
      }

      final priority = Priority.fromString(priorityInput);

      final Task task;

      if (priority == Priority.high) {
        task = UrgentTask(
          id: const Uuid().v4(),
          title: title,
          dueDate: dueDate,
        );
      } else {
        task = BasicTask(
          id: const Uuid().v4(),
          title: title,
          priority: priority,
          dueDate: dueDate,
        );
      }

      await service.addTask(task);

      print("\nTask created successfully.");
    } on FormatException {
      print("Invalid date format.");
    } on TaskException catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
  }

  Future<void> displayTasks() async {
    print("\nSort by:");
    print("1. Priority");
    print("2. Due Date");
    print("3. None");

    stdout.write("Choice: ");

    final choice = stdin.readLineSync();

    List<Task> tasks;

    switch (choice) {
      case "1":
        tasks = await service.getTasksSortedByPriority();
        break;

      case "2":
        tasks = await service.getTasksSortedByDate();
        break;

      default:
        tasks = await service.getTasks();
    }

    if (tasks.isEmpty) {
      print("\nNo tasks found.");
      return;
    }

    print("");

    for (final task in tasks) {
      print("--------------------------------");

      print("ID        : ${task.id}");

      print("Title     : ${task.title}");

      print("Priority  : ${task.priority.label}");

      print(
          "Completed : ${task.completed ? "Yes" : "No"}");

      print(
          "Due Date  : ${task.dueDate?.toString().split(" ").first ?? "None"}");
    }

    print("--------------------------------");
  }

  Future<void>completeTask()async{

    stdout.write("Task ID : ");

    final id=stdin.readLineSync();

    if(id==null||id.isEmpty){

      return;

    }

    try{

      await service.completeTask(id);

      print("Task completed.");

    }

    on TaskException catch(e){

      print(e);

    }

  }

  Future<void>deleteTask()async{

    stdout.write("Task ID : ");

    final id=stdin.readLineSync();

    if(id==null||id.isEmpty){

      return;

    }

    try{

      await service.deleteTask(id);

      print("Task deleted.");

    }

    on TaskException catch(e){

      print(e);

    }

  }

}