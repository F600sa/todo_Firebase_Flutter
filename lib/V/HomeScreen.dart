import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:todpapp/C/TastController.dart';
import 'package:todpapp/M/TaskModel.dart';
import 'package:todpapp/V/showTasks.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    final cotrollerGetxFirebase = Get.put(TaskController());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: controller,
            ),
            TextButton(
                onPressed: () {
                  final taskModel = TaskModel(task: controller.text);
                  cotrollerGetxFirebase.addTaskWithFireBase(taskModel);
                },
                child: Text("Send")),
            TextButton(
                onPressed: () {
                  Get.to(() => ShowTasks());
                },
                child: Text("ShowTask")),
          ],
        ),
      ),
    );
  }
}
