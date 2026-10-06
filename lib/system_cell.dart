import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

class SystemCell extends StatelessWidget {
  final SystemInfo systemInfo;

  const SystemCell({
    super.key,
    required this.systemInfo,
  });

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
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(30, 63, 120, 1),
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

  const _SystemItem({
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(30, 63, 120, 1),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            color: Colors.grey,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}