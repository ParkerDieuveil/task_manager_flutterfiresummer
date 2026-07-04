import '../enums/priority.dart';
import '../interfaces/json_serializable.dart';

abstract class Task implements JsonSerializable {

  final String id;

  String title;

  Priority priority;

  DateTime? dueDate;

  bool completed;

  Task({

    required this.id,

    required this.title,

    required this.priority,

    this.dueDate,

    this.completed=false

  });

  void markCompleted(){

    completed=true;

  }

  @override
  Map<String,dynamic> toJson(){

    return{

      "id":id,

      "title":title,

      "priority":priority.name,

      "dueDate":dueDate?.toIso8601String(),

      "completed":completed

    };

  }

}