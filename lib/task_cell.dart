import 'package:flutter/material.dart';
import 'list_item.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'task_detail.dart';

class TaskCell extends StatelessWidget {
  final ListItem item;
  final bool isIncident;

  const TaskCell({super.key, required this.item, this.isIncident = false});

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
                const SizedBox(height: 6),
            
                Text(
                  item.taskId,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(34, 74, 163, 1),
                  ),
                ),
            
                const SizedBox(height: 14),
            
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/laptop-light.svg',
                      width: 14,
                      height: 14,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      item.subTitle,
                      style: const TextStyle(
                        color: Color.fromRGBO(120, 120, 120, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
            
                    const SizedBox(width: 16),
            
                    SvgPicture.asset(
                      'assets/images/atmid-light.svg',
                      width: 14,
                      height: 14,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      item.atmId,
                      style: const TextStyle(
                        color: Color.fromRGBO(120, 120, 150, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
            
                const SizedBox(height: 8),
            
                if (isIncident)
                  Text(
                    item.engineerShortName,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Color.fromRGBO(43, 48, 117, 1),
                    ),
                  ),
            
                if (isIncident) const SizedBox(height: 8),
            
                Text(
                  item.fullAddress,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color.fromRGBO(43, 48, 117, 1),
                  ),
                ),
            
                const SizedBox(height: 18),
            
                _TaskCellFooter(item: item, isIncident: isIncident),
              ],
            ),
          ),
          if (!isIncident)
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset(
              item.imagePath(),
              width: 69,
              height: 62,
            ),
          ),
        ],
      ),
    );
  }
}

class _TaskCellFooter extends StatelessWidget {
  final ListItem item;
  final bool isIncident;

  const _TaskCellFooter({required this.item, required this.isIncident});

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

        if (isIncident)
          Expanded(
            child: _ValueColumn(value: item.incidentStatus, title: 'Status'),
          ),

        if (!isIncident)
          Expanded(
            child: _ValueColumn(
              value: item.pft == null
                  ? 'Not set'
                  : DateFormat('dd.MM HH:mm').format(item.pft!.toLocal()),
              title: 'Deadline',
            ),
          ),

        if (!isIncident)
          _ImageColumn(
            image: item.status.imagePath,
            title: item.status.description,
          ),
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

class _ImageColumn extends StatelessWidget {
  final String image;
  final String title;

  const _ImageColumn({required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(image, width: 20, height: 20),
        Text(
          title,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w300,
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
      ],
    );
  }
}
