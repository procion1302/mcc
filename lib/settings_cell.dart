import 'package:flutter/material.dart';

class SettingsCell extends StatelessWidget {


  const SettingsCell({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Text('Settings Cell'),
        ],
      ),
    );
  }
}