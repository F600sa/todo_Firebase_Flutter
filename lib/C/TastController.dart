import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../M/TaskModel.dart';
import '../V/showTasks.dart';

class TaskController extends GetxController {
  final getData = FirebaseFirestore.instance.collection('Task').snapshots();
  List<dynamic> tasksList = [].obs;
  List<dynamic> listTasks = [].obs;
  TextEditingController controllerTextField = TextEditingController();
  addTaskWithFireBase(TaskModel taskModel) async {
    final idtRef = FirebaseFirestore.instance.collection('Task').doc();
    await FirebaseFirestore.instance.collection('Task').doc().set({
      'id': idtRef.id,
      'task': taskModel.task,
      'datee': Timestamp.now(),
    });
    Get.to(ShowTasks());
  }

  deleteTaskWithFireBase(deleteTask) {
    final DeleteFireBase =
        FirebaseFirestore.instance.collection('Task').doc(deleteTask).delete();
  }

  updateTaskWithFireBase(updateTask, TaskModel taskModel) async {
    await FirebaseFirestore.instance
        .collection('Task')
        .doc(updateTask)
        .update({'task': taskModel.task});
  }
}
