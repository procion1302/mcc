
import 'package:flutter/material.dart';
import 'list_item.dart';

class IncidentDetailHeaderCell extends StatelessWidget {
  final ListItem item;

  const IncidentDetailHeaderCell({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          Text(
            item.taskId,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(34, 74, 163, 1),
            ),
          ),

          const SizedBox(height: 4),

          Text(
            item.subTitle,
            style: const TextStyle(
              color: Color.fromRGBO(142, 144, 182, 1),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 3),

          Text(
            item.engineerShortName,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(115, 115, 140, 1),
            ),
          ),

          const SizedBox(height: 18),

          _ValueColumn(
            value: item.incidentStatus,
            title: 'Status',
          ),
        ],
      ),
    );
  }
}

class _ValueColumn extends StatelessWidget {
  final String value;
  final String title;

  const _ValueColumn({
    required this.value,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: Color.fromRGBO(43, 48, 117, 1),
          ),
        ),
        const SizedBox(height: 0),
        Text(
          title,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w300,
            color: Color.fromRGBO(120, 120, 120, 1),
          ),
        ),
      ],
    );
  }
}
