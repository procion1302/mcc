import 'package:flutter/material.dart';
import 'list_item.dart';
import 'package:intl/intl.dart';
//import 'task_detail.dart';

class TaskCell extends StatelessWidget {
  final ListItem item;

  const TaskCell({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.taskId,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 4),

          Row(
            children: [
              Image.asset(
                'assets/images/sub_logo.png',
                width: 20,
                height: 20,
              ),
              const SizedBox(width: 4),
              Text(item.subTitle),

              const SizedBox(width: 16),

              Image.asset('assets/images/sub_logo.png', width: 20, height: 20),
              const SizedBox(width: 4),
              Text(item.atmId),
            ],
          ),

          const SizedBox(height: 4),

          Text(item.fullAddress),

          const SizedBox(height: 12),

          _TaskCellFooter(item: item),
        ],
      ),
    );
  }
}

class _TaskCellFooter extends StatelessWidget {
  final ListItem item;

  const _TaskCellFooter({required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _ValueColumn(
            value: DateFormat('dd.MM HH:mm').format(item.openTime.toLocal()),
            title: 'Opening date',
          ),
        ),
        Expanded(
          child: _ValueColumn(value: DateFormat('dd.MM HH:mm').format(item.pft.toLocal()), title: 'Deadline'),
        ),
        _ImageColumn(image: 'assets/images/sub_logo.png', title: item.status.description),
      ],
    );
  }
}

class _ValueColumn extends StatelessWidget {
  final String value;
  final String title;

  const _ValueColumn({required this.value, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Text(value), Text(title)],
    );
  }
}

class _ImageColumn extends StatelessWidget {
  final String image;
  final String title;

  const _ImageColumn({required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Image.asset(image, width: 32, height: 32), Text(title)],
    );
  }
}
