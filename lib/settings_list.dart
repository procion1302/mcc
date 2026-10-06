import 'package:flutter/material.dart';
import 'account_cell.dart';
import 'system_cell.dart';

class SettingsScreen extends StatefulWidget {
  final User? user;

  const SettingsScreen({
    super.key,
    this.user,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(49, 92, 181, 1),
        child: Column(
          children: [
            const SizedBox(height: 50),

            const Text(
              'Settings',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
                children: [
                  if (widget.user != null) ...[
                    AccountCell(user: widget.user!),
                    const SizedBox(height: 15),
                  ],

                  const SystemCell(
                    systemInfo: SystemInfo(
                      appVersion: '1.0.0',
                      osVersion: 'Android 12',
                      deviceModel: 'Pixel 6',
                    ),
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