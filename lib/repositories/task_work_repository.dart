import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tasker/models/task_work.dart';

class TaskWorkRepository {
  final _taskWorksRef = FirebaseFirestore.instance.collection("taskworks");

  Future<List<TaskWork>> fetchTasks() async {
    final snapshot = await _taskWorksRef.get();
    return snapshot.docs.map((doc) {
      return TaskWork.fromJson(doc.data()).copyWith(id: doc.id);
    }).toList();
  }

  Future<List<TaskWork>?> fetchTasksByTaskId(String taskId) async {
    final snapshot =
        await _taskWorksRef.where("taskId", isEqualTo: taskId).get();
    if (snapshot.docs.isEmpty) {
      return [];
    }
    return snapshot.docs.map((doc) {
      return TaskWork.fromJson(doc.data()).copyWith(id: doc.id);
    }).toList();
  }

  Future<DocumentReference<Map<String, dynamic>>> addTaskWork(
    TaskWork taskWork,
  ) async {
    return await _taskWorksRef.add(taskWork.toJson());
  }

  Future<void> updateEndedAt(docId, TaskWork taskwork) async {
    return await _taskWorksRef.doc(docId).update({
      "updatedAt": taskwork.updatedAt,
      "endedAt": taskwork.endedAt!,
    });
  }

  Future<void> toggleTaskDone(TaskWork taskWork) async {
    await _taskWorksRef.doc(taskWork.id).update({'isDone': !taskWork.isDone});
  }
}
