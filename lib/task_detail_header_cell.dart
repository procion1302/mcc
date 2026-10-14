import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'list_item.dart';

class TaskDetailHeaderCell extends StatelessWidget {
  final ListItem item;

  const TaskDetailHeaderCell({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //const SizedBox(height: 6),
                Text(
                  item.taskId,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(34, 74, 163, 1),
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  item.subTitle,
                  style: const TextStyle(
                    color: Color.fromRGBO(120, 120, 120, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 6),

                Row(
                  children: [
                    SvgPicture.asset(
                      item.status.imagePath,
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      item.status.description,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w300,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          if (item.imagePath().isNotEmpty)
            Positioned(
              top: 0,
              right: 0,
              child: SvgPicture.asset(item.imagePath(), width: 69, height: 62),
            ),
        ],
      ),
    );
  }
}
