import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasker/models/task_basic_info.dart';
import 'package:tasker/repositories/task_basic_info_repository.dart';

final taskBasicInfoRepositoryProvider = Provider(
  (ref) => TaskBasicInfoRepository(),
);

final taskBasicInfoListProvider = FutureProvider<List<TaskBasicInfo>>((
  ref,
) async {
  final repo = ref.watch(taskBasicInfoRepositoryProvider);
  return repo.fetchTasks();
});
