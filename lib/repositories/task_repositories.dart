import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasker/models/task.dart';
import 'package:tasker/viewModels/progress.dart';
import 'database_helper.dart';

final databaseProvider = Provider<DatabaseHelper>((ref) => DatabaseHelper());

class TaskNotifier extends StateNotifier<List<Task>> {
  final Ref ref;
  final DatabaseHelper dbHelper;

  TaskNotifier(this.ref, this.dbHelper) : super([]) {
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    state = await dbHelper.getTasks();
    final doneTaskCount = state.where((task) => task.isDone).length;
    final taskCount = state.length;
    final progressPercentage = doneTaskCount / taskCount * 100;

    final progressNotifier = ref.read(progressProvider.notifier);
    progressNotifier.set(progressPercentage);
    print(progressPercentage);
  }

  Future<void> addTask(Task task) async {
    await dbHelper.insertTask(task);
    _loadTasks();
  }

  Future<void> updateTask(Task task) async {
    await dbHelper.updateTask(task);
    _loadTasks();
  }

  Future<void> deleteTask(int id) async {
    await dbHelper.deleteTask(id);
    _loadTasks();
  }

  Future<void> clearAll() async {
    await dbHelper.clearTable("Tasks");
    _loadTasks();
  }
}

final taskListProvider = StateNotifierProvider<TaskNotifier, List<Task>>((ref) {
  final dbHelper = ref.watch(databaseProvider);
  return TaskNotifier(ref, dbHelper);
});
