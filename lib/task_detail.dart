import 'package:flutter/material.dart';
import 'task_detail_cell.dart';


class DetailSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const DetailSection({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 4,
            bottom: 8,
          ),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ...children,
      ],
    );
  }
}

class TaskDetailScreen extends StatefulWidget {
  const TaskDetailScreen({super.key});

  @override
  State<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(49, 92, 181, 1),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
              child: Stack(
                children: [
                  Center(
                    child: Text(
                      'Task Detail',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: BackButton(color: Colors.white),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
  child: ListView(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    
children: const [
  TaskDetailCell(),
  SizedBox(height: 30),

  DetailSection(
    title: 'Секция 1',
    children: [
      TaskDetailCell(),
      SizedBox(height: 16),
      TaskDetailCell(),
    ],
  ),
  SizedBox(height: 30),
  DetailSection(
    title: 'Секция 2',
    children: [
      TaskDetailCell(),
      SizedBox(height: 16),
      TaskDetailCell(),
    ],
  ),
  SizedBox(height: 30),
  DetailSection(
    title: 'Секция 3',
    children: [
      TaskDetailCell(),
    ],
  ),
],

  ),
),
          ],
        ),
      ),
    );
  }
}
