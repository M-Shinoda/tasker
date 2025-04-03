import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasker/models/task.dart';
import 'package:tasker/repositories/task_repositories.dart';

class CreateTaskButton extends ConsumerWidget {
  const CreateTaskButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () async {
        final newTodo = await showDialog<Task>(
          context: context,
          builder: (context) {
            String title = '';
            String description = '';

            return AlertDialog(
              title: Text('Add Todo'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    onChanged: (value) => title = value,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Description'),
                    onChanged: (value) => description = value,
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).pop(Task(title: title, description: description));
                  },
                  child: Text('Add'),
                ),
              ],
            );
          },
        );

        if (newTodo != null) {
          ref.read(taskListProvider.notifier).addTask(newTodo);
        }
      },
      child: Icon(Icons.add),
    );
  }
}
