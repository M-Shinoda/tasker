import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasker/models/task_work.dart';
import 'package:tasker/repositories/task_work_repository.dart';

final taskWorkRepositoryProvider = Provider((ref) => TaskWorkRepository());

final taskWorkListProvider = FutureProvider<List<TaskWork>>((ref) async {
  final repo = ref.watch(taskWorkRepositoryProvider);
  return repo.fetchTasks();
});
