import 'package:flutter/material.dart';
import 'account_cell.dart';
import 'system_cell.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';

class SettingsScreen extends StatefulWidget {
  final User? user;

  const SettingsScreen({super.key, this.user});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  SystemInfo? systemInfo;

  Future<void> loadSystemInfo() async {
    final info = await SystemInfoService.load();

    if (!mounted) return;

    setState(() {
      systemInfo = info;
    });
  }

  @override
  void initState() {
    super.initState();
    loadSystemInfo();
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
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: BackButton(
          color: Colors.white,
        ),
      ),
    ],
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

                  if (systemInfo != null) SystemCell(systemInfo: systemInfo!),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
