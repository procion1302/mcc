import 'package:flutter/material.dart';
import 'api_service.dart';
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
          _Header(item: item),
          const SizedBox(height: 12),

          // _ActionButton(item: item),
          // const SizedBox(height: 12),

          // _Details(item: item),
          // const SizedBox(height: 12),

          // _Footer(item: item),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final ListItem item;

  const _Header({required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        /*
        Image.asset(
          ProcessTypeConfig.getImagePath(item.processType),
          width: 32,
          height: 32,
        ),

        const SizedBox(width: 12),*/

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              /*
              Text(
                item.processType,
                style: TextStyle(
                  fontSize: 12,
                  color: Color.fromRGBO(69, 94, 120, 1.0),
                  fontWeight: FontWeight.w300,
                ),
              ),

              const SizedBox(height: 0),
              */
              Text(
                item.taskId,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(45, 66, 103, 1.0),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/*
class _Details extends StatelessWidget {
  final ListItem item;

  const _Details({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color.fromRGBO(237, 246, 255, 1.0),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DetailRow(
            image: Image.asset(
              'assets/images/timer.png',
              width: 30,
              fit: BoxFit.contain,
            ),
            text: item.date,
          ),
          const SizedBox(height: 6),
          DetailRow(
            image: Image.asset(
              'assets/images/info.png',
              width: 30,
              fit: BoxFit.contain,
            ),
            text: item.client,
          ),
          const SizedBox(height: 6),
          DetailRow(
            image: Image.asset(
              'assets/images/tid.png',
              width: 30,
              fit: BoxFit.contain,
            ),
            text: item.tid,
          ),
        ],
      ),
    );
  }
}

class DetailRow extends StatelessWidget {
  final Widget image;
  final String text;

  const DetailRow({required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        image,
        const SizedBox(width: 3),
        Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            color: Color.fromRGBO(37, 62, 102, 1.0),
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final ListItem item;

  const _ActionButton({required this.item});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => TaskDetailScreen(item: item)),
        );
      },
      style: TextButton.styleFrom(
        backgroundColor: Color.fromRGBO(255, 237, 217, 1.0), // светло-оранжевый
        foregroundColor: Color.fromRGBO(
          245,
          137,
          28,
          1.0,
        ), // тёмно-оранжевый (текст + иконки)
        elevation: 0, // на всякий случай (хотя у TextButton тени нет)
        shadowColor: Colors.transparent,
        minimumSize: const Size(170, 45),
      ),
      child: Text(item.actionTitle),
    );
  }
}

class _Footer extends StatelessWidget {
  final ListItem item;

  const _Footer({required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/tsp.png', width: 30, fit: BoxFit.contain),

        /*
        const Icon(
          Icons.location_on_outlined,
          size: 18,
          color: Colors.grey,
        ),*/
        const SizedBox(width: 3),

        Expanded(
          child: Text(
            item.address,
            style: TextStyle(
              color: Color.fromRGBO(21, 50, 96, 1.0),
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}*/
/*
class _Title extends StatelessWidget {
  final String text;

  const _Title(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _Subtitle extends StatelessWidget {
  final String text;

  const _Subtitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}*/