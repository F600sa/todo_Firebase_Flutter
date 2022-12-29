import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todpapp/C/TastController.dart';
import 'package:todpapp/M/TaskModel.dart';

class ShowTasks extends StatelessWidget {
  const ShowTasks({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TaskController());
    TextEditingController controllerTextField = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: StreamBuilder(
        stream: controller.getData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            controller.listTasks = snapshot.data!.docs
                .map((e) => TaskModel(task: e['task']))
                .toList();
          }
          return ListView.builder(
              itemCount: controller.listTasks.length,
              itemBuilder: ((context, index) {
                final SnapShotDATA = snapshot.data!.docs[index].id;
                return Column(
                  children: [
                    Text(controller.listTasks[index].task),
                    IconButton(
                        onPressed: () {
                          Get.bottomSheet(
                            Column(
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                TextField(
                                  controller: controllerTextField,
                                ),
                                TextButton(
                                    onPressed: () {
                                      final taskModel = TaskModel(
                                          task: controllerTextField.text);
                                      controller.updateTaskWithFireBase(
                                          SnapShotDATA, taskModel);
                                      Get.back();
                                    },
                                    child: Text("Update"))
                              ],
                            ),
                          );
                        },
                        icon: Icon(Icons.edit)),
                    //
                    ///
                    /////
                    /////
                    /////
                    //////
                    ///
                    ///
                    ///
                    IconButton(
                        onPressed: () {
                          controller.deleteTaskWithFireBase(SnapShotDATA);
                        },
                        icon: Icon(Icons.delete))
                  ],
                );
              }));
        },
      )),
    );
  }
}
