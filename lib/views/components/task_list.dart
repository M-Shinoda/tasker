import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasker/repositories/task_repositories.dart';

class TodoList extends HookConsumerWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(taskListProvider);

    return Stack(
      alignment: Alignment.center,
      children: [
        ListView.separated(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            final todo = todos[index];
            return ListTile(
              title: Text(todo.title),
              subtitle: Text(todo.description ?? ''),
              trailing: Checkbox(
                value: todo.isDone,
                onChanged: (bool? value) {
                  ref
                      .read(taskListProvider.notifier)
                      .updateTask(todo.copyWith(isDone: value ?? false));
                },
              ),
              onLongPress: () {
                ref.read(taskListProvider.notifier).deleteTask(todo.id!);
              },
            );
          },
          separatorBuilder:
              (BuildContext context, int index) => const Divider(),
        ),
      ],
    );
  }
}
