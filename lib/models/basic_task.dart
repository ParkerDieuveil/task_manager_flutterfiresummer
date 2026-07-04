import '../enums/priority.dart';
import 'task.dart';

class BasicTask extends Task{

  BasicTask({

    required super.id,

    required super.title,

    required super.priority,

    super.dueDate,

    super.completed

  });

  factory BasicTask.fromJson(Map<String,dynamic> json){

    return BasicTask(

      id: json["id"],

      title: json["title"],

      priority: Priority.fromString(json["priority"]),

      dueDate: json["dueDate"]==null

          ? null

          : DateTime.parse(json["dueDate"]),

      completed: json["completed"]

    );

  }

}