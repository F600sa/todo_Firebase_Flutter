import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class TaskModel {
  String? id;
  late String? task;
  Timestamp? datee;

  TaskModel({
    this.id,
    required this.task,
    this.datee,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        task: json["task"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        'task': task,
        'datee': datee,
      };
}
