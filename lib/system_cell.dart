import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';

class SystemInfo {
  final String appVersion;
  final String osVersion;
  final String deviceModel;

  const SystemInfo({
    required this.appVersion,
    required this.osVersion,
    required this.deviceModel,
  });
}

class SystemInfoService {
  static Future<SystemInfo> load() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final deviceInfo = DeviceInfoPlugin();

    String osVersion;
    String deviceModel;

    if (Platform.isAndroid) {
      final info = await deviceInfo.androidInfo;

      osVersion = 'Android ${info.version.release}';
      deviceModel = info.model;
    } else if (Platform.isIOS) {
      final info = await deviceInfo.iosInfo;

      osVersion = 'iOS ${info.systemVersion}';
      deviceModel = info.utsname.machine;
    } else if (Platform.isMacOS) {
      final info = await deviceInfo.macOsInfo;

      osVersion = 'macOS ${info.osRelease}';
      deviceModel = info.model;
    } else {
      osVersion = 'Unknown';
      deviceModel = 'Unknown';
    }

    return SystemInfo(
      appVersion: packageInfo.version,
      osVersion: osVersion,
      deviceModel: deviceModel,
    );
  }
}

class SystemCell extends StatelessWidget {
  final SystemInfo systemInfo;

  const SystemCell({super.key, required this.systemInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'System Data',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
                color: Color.fromRGBO(30, 65, 160, 1),
              ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _SystemItem(
                  value: systemInfo.appVersion,
                  label: 'App Version',
                ),
              ),
              Expanded(
                child: _SystemItem(
                  value: systemInfo.osVersion,
                  label: 'OS Version',
                ),
              ),
              Expanded(
                child: _SystemItem(
                  value: systemInfo.deviceModel,
                  label: 'Phone Model',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SystemItem extends StatelessWidget {
  final String value;
  final String label;

  const _SystemItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: Color.fromRGBO(16, 13, 107, 1),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 10, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
