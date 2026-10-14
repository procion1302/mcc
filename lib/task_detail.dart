import 'package:flutter/material.dart';
import 'task_detail_cell.dart';
import 'list_item.dart';
import 'task_detail_header_cell.dart';
import 'incident_detail_header_cell.dart';


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
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: 14),
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
  
  final testItem = ListItem(
  taskId: 'TASK-123456',
  deviceRegion: 'Île-de-France',
  deviceCity: 'Paris',
  deviceAddress: '10 Rue de Rivoli',
  atmId: 'ATM-98765',
  engineerContact: 'Jean Dupont Martin',
  status: TaskStatus.accepted,
  incidentStatus: 'Waiting client',
  serviceType: ServiceType.flm,
  workType: WorkType.claim,
  category: TaskCategory.service,
  openTime: DateTime(2026, 10, 10, 14, 30),
  pft: DateTime(2099, 12, 31),
);

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
    
children: [
  //TaskDetailCell(value: 'Value 1', label: 'Label 1'),
  TaskDetailHeaderCell(item: testItem),
  SizedBox(height: 30),
  IncidentDetailHeaderCell(item: testItem),
  SizedBox(height: 30),

  DetailSection(
    title: 'Main',
    children: [
      TaskDetailCell(value: 'Value 2', label: 'Label 2'),
      SizedBox(height: 16),
      TaskDetailCell(value: 'Value 3', label: 'Label 3'),
    ],
  ),
  SizedBox(height: 30),
  DetailSection(
    title: 'Dates',
    children: [
      TaskDetailCell(value: 'Value 4', label: 'Label 4'),
      SizedBox(height: 16),
      TaskDetailCell(value: 'Value 5', label: 'Label 5'),
    ],
  ),
  SizedBox(height: 30),
  DetailSection(
    title: 'Incident',
    children: [
      TaskDetailCell(value: 'Value 6'),
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
