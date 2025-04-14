import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasker/views/components/create_task_button.dart';
import 'package:tasker/views/components/progress_bar.dart';
import 'package:tasker/views/components/reminder_list.dart';
import 'package:tasker/views/components/task_list.dart';
import 'package:tasker/views/components/task_basic_info_list.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(width: 220, height: 220, child: DayTaskProgressBar()),
          Expanded(child: TodoList()),
          Divider(),
          Expanded(child: ReminderListView()),
          Divider(),
          Expanded(child: TaskBasicInfoList()),
        ],
      ),
      floatingActionButton: CreateTaskButton(),
    );
  }
}
