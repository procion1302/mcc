import 'package:flutter/material.dart';
import 'task_detail_cell.dart';
import 'list_item.dart';
import 'task_detail_header_cell.dart';
import 'incident_detail_header_cell.dart';
import 'package:intl/intl.dart';
import 'task_detail.dart';


class IncidentDetailScreen extends StatefulWidget {
  final ListItem item;

  const IncidentDetailScreen({super.key, required this.item});

  @override
  State<IncidentDetailScreen> createState() => _IncidentDetailScreenState();
}

class _IncidentDetailScreenState extends State<IncidentDetailScreen> {
  /*
  final testItem = ListItem(
  taskId: 'TASK-123456',
  deviceRegion: 'Île-de-France',
  deviceCity: 'Paris',
  deviceAddress: '10 Rue de Rivoli',
  atmId: 'ATM-98765',
  engineerContact: 'Jean Dupont Martin',
  status: TaskStatus.accepted,
  incidentStatus: 'Waiting client',
  serviceType: ServiceType.flm,
  workType: WorkType.claim,
  category: TaskCategory.service,
  openTime: DateTime(2026, 10, 10, 14, 30),
  pft: DateTime(2099, 12, 31),
  description: List.empty()
);*/

  @override
  void initState() {
    super.initState();
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
                      'Incident',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: BackButton(color: Colors.white),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),

                children: [
                  //TaskDetailHeaderCell(item: widget.item),

                  IncidentDetailHeaderCell(item: widget.item),
                  SizedBox(height: 60),

                  DetailSection(
                    title: 'Main',
                    children: [
                      TaskDetailCell(value: widget.item.desc), //TODO: add region details
                      SizedBox(height: 16),
                      TaskDetailCell(
                        value: widget.item.caseId,
                        label: "Case ID",
                      ),
                      SizedBox(height: 16),

                      TaskDetailCell(
                        value: widget.item.numberId!,
                        label: "Internal ID",
                      ),
                      SizedBox(height: 16),

                      if (widget.item.engineerContact != null) ...[
                          TaskDetailCell(
                            value: widget.item.engineerContact!,
                            label: 'Engineer name',
                          ),
                          SizedBox(height: 16),
                      ],

                      TaskDetailCell(
                        value: widget.item.serviceType.description,
                        label: 'Service type',
                      ),
                      SizedBox(height: 16),

                      TaskDetailCell(
                        value: widget.item.workType.description,
                        label: 'Work type',
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                  SizedBox(height: 30),

                  DetailSection(
                    title: 'Dates',
                    children: [
                      TaskDetailCell(
                        value: DateFormat(
                          'dd MMMM y HH:mm',
                        ).format(widget.item.openTime.toLocal()),
                        label: 'Open time',
                      ),
                      SizedBox(height: 16),

                      if (widget.item.pft != null) ...[
                        TaskDetailCell(
                          value: DateFormat(
                            'dd MMMM y HH:mm',
                          ).format(widget.item.pft!.toLocal()),
                          label: 'PFT',
                        ),
                        SizedBox(height: 16),
                      ],

                      if (widget.item.resolvedTime != null) ...[
                        TaskDetailCell(
                          value: DateFormat(
                            'dd MMMM y HH:mm',
                          ).format(widget.item.resolvedTime!.toLocal()),
                          label: 'Resolved time',
                        ),
                        SizedBox(height: 16),
                      ],

                      if (widget.item.closeTime != null) ...[
                        TaskDetailCell(
                          value: DateFormat(
                            'dd MMMM y HH:mm',
                          ).format(widget.item.closeTime!.toLocal()),
                          label: 'Close time',
                        ),
                        SizedBox(height: 16),
                      ],
                    ],
                  ),
                  SizedBox(height: 30),

                  DetailSection(
                    title: 'Other',
                    children: [
                      if (widget.item.deviceSerialNo != null) ...[
                          TaskDetailCell(
                            value: widget.item.deviceSerialNo!,
                            label: 'Device serial number',
                          ),
                          SizedBox(height: 16),
                      ],

                      if (widget.item.atmId != null) ...[
                          TaskDetailCell(
                            value: widget.item.atmId!,
                            label: 'ATM ID',
                          ),
                          SizedBox(height: 16),
                      ],
                    ],
                  ),
                  SizedBox(height: 30),

                  if (widget.item.isClosed) ...[
                    DetailSection(
                      title: 'Close',
                      children: [
                        if (widget.item.resolution != null) ...[
                          TaskDetailCell(
                            value: widget.item.resolutionDesc,
                            label: 'Closing comment',
                          ),
                          SizedBox(height: 16),
                        ],
                      ],
                    ),
                    SizedBox(height: 30),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
