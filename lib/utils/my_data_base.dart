import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/models/task_model/task_model.dart';

class MyDataBase {
  static CollectionReference<TaskModel> getTaskCollecetion() {
    return FirebaseFirestore.instance
        .collection(TaskModel.name)
        .withConverter<TaskModel>(fromFirestore: (snapShot, _) {
      return TaskModel.fromJson(snapShot.data()!);
    }, toFirestore: (task, _) {
      return task.toJson();
    });
  }

  static Future<void> addTaskDataBase(TaskModel task) {
    var collection = getTaskCollecetion();
    var document = collection.doc();
    task.id = document.id;
    return document.set(task);
  }
}