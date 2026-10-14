
import 'package:flutter/material.dart';

class TaskDetailCell extends StatelessWidget {
  final String value;
  final String? label;

  const TaskDetailCell({
    super.key,
    required this.value,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
              color: Color.fromRGBO(33, 65, 160, 1),
            ),
          ),
          if (label != null) ...[
            const SizedBox(height: 4),
            Text(
              label!,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: Color.fromRGBO(103, 103, 103, 1),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
