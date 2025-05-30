import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tasker/models/task_basic_info.dart';

class TaskBasicInfoRepository {
  final _taskBasicInfosRef = FirebaseFirestore.instance.collection(
    "taskBasicInfo",
  );

  Future<List<TaskBasicInfo>> fetchTasks() async {
    final snapshot = await _taskBasicInfosRef.get();
    return snapshot.docs.map((doc) {
      return TaskBasicInfo.fromJson(doc.data()).copyWith(id: doc.id);
    }).toList();
  }

  Future<TaskBasicInfo?> fetchTaskByTaskId(String taskId) async {
    final snapshot =
        await _taskBasicInfosRef.where("taskId", isEqualTo: taskId).get();
    if (snapshot.docs.isEmpty) {
      return null;
    }
    if (snapshot.docs.length > 1) {
      throw Exception("Multiple tasks found with the same taskId");
    }
    final doc = snapshot.docs.first;
    return TaskBasicInfo.fromJson(doc.data()).copyWith(id: doc.id);
  }

  Future<void> addTask(TaskBasicInfo taskBasicInfo) async {
    await _taskBasicInfosRef.add(taskBasicInfo.toJson());
  }

  Future<void> toggleTaskDone(TaskBasicInfo taskBasicInfo) async {
    await _taskBasicInfosRef.doc(taskBasicInfo.id).update({
      'isDone': !taskBasicInfo.isDone,
    });
  }
}
