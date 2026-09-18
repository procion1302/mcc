import 'package:flutter/material.dart';
import 'api_service.dart';
import 'task_cell.dart';

class TaskListScreen extends StatefulWidget {
  final String token;

  const TaskListScreen({super.key, required this.token});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<dynamic> items = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
      final result = await ApiService.fetchTasks(login: '', password: ''); // Replace with actual login and password

      setState(() {
        items = result;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Заявки')),
      body: ListView.separated(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return TaskCell(item: item);
        },
        separatorBuilder: (context, index) =>
            const Divider(height: 1, thickness: 1),
      )
    );
  }
}
