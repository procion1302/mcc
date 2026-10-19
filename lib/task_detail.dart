import 'package:flutter/material.dart';
import 'task_detail_cell.dart';
import 'list_item.dart';
import 'task_detail_header_cell.dart';
import 'incident_detail_header_cell.dart';
import 'package:intl/intl.dart';

class DetailSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const DetailSection({super.key, required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: 14),
        ...children,
      ],
    );
  }
}

class TaskDetailScreen extends StatefulWidget {
  final ListItem item;

  const TaskDetailScreen({super.key, required this.item});

  @override
  State<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
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
                      'Task',
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
                  TaskDetailHeaderCell(item: widget.item),
                  SizedBox(height: 60),

                  DetailSection(
                    title: 'Main',
                    children: [

                      TaskDetailCell(value: widget.item.desc),
                      SizedBox(height: 16),

                      TaskDetailCell(
                        value: widget.item.category.description,
                        label: 'Category',
                      ),
                      SizedBox(height: 16),

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
                        label: 'Opening date',
                      ),
                      SizedBox(height: 16),

                      if (widget.item.pft != null) ...[
                        TaskDetailCell(
                          value: DateFormat(
                            'dd MMMM y HH:mm',
                          ).format(widget.item.pft!.toLocal()),
                          label: 'Deadline',
                        ),
                        SizedBox(height: 16),
                      ],

                      if (widget.item.eta != null) ...[
                        TaskDetailCell(
                          value: DateFormat(
                            'dd MMMM y HH:mm',
                          ).format(widget.item.eta!.toLocal()),
                          label: 'ETA',
                        ),
                        SizedBox(height: 16),
                      ],
                    ],
                  ),
                  SizedBox(height: 30),

                  DetailSection(
                    title: 'Incident',
                    children: [
                      TaskDetailCell(
                        value: widget.item.parentIncident,
                        label: "Parent incident",
                      ),
                      SizedBox(height: 16),
                      
                      TaskDetailCell(
                        value: widget.item.caseId,
                        label: "Case ID",
                      ),
                      SizedBox(height: 16),

                      if (widget.item.incidentOpenTime != null) ...[
                        TaskDetailCell(
                          value: DateFormat(
                            'dd MMMM y HH:mm',
                          ).format(widget.item.incidentOpenTime!.toLocal()),
                          label: 'Opening date of parent incident',
                        ),
                        SizedBox(height: 16),
                      ],

                      TaskDetailCell(
                        value: widget.item.incidentDesc,
                        label: "Description of parent incident",
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                  SizedBox(height: 30),

                  if (widget.item.isClosed) ...[
                    DetailSection(
                      title: 'Close',
                      children: [
                        if (widget.item.technicianNote != null &&
                            widget.item.technicianNote!.isNotEmpty) ...[
                          TaskDetailCell(
                            value: widget.item.technicianNote!,
                            label: 'Closing comment',
                          ),
                          SizedBox(height: 16),
                        ] else if (widget.item.taskOutcome != null) ...[
                          TaskDetailCell(
                            value: widget.item.taskOutcomeDesc,
                            label: 'Closing comment',
                          ),
                          SizedBox(height: 16),
                        ],
                        
                        if (widget.item.category == TaskCategory.waitPartner &&
                            widget.item.closeTime != null) ...[
                          TaskDetailCell(
                            value: DateFormat(
                              'dd MMMM y HH:mm',
                            ).format(widget.item.closeTime!.toLocal()),
                            label: 'Close time',
                          ),
                          SizedBox(height: 16),
                        ],
                        
                        if (widget.item.repairTimeEnd != null) ...[
                          TaskDetailCell(
                            value: DateFormat(
                              'dd MMMM y HH:mm',
                            ).format(widget.item.repairTimeEnd!.toLocal()),
                            label: 'Repair time end',
                          ),
                          SizedBox(height: 16),
                        ],

                        if (widget.item.resultCode != null) ...[
                          TaskDetailCell(
                            value: widget.item.resultCode!.description,
                            label: 'Result code',
                          ),
                          SizedBox(height: 16),
                        ],

                        //add EBS handling
                        if (widget.item.finishCode != null) ...[
                          TaskDetailCell(
                            value: widget.item.finishCode!,
                            label: 'Finish code',
                          ),
                          SizedBox(height: 16),
                        ],

                        if (widget.item.sectionCode != null) ...[
                          TaskDetailCell(
                            value: widget.item.sectionCode!,
                            label: 'Section code',
                          ),
                          SizedBox(height: 16),
                        ],

                        //add EBS handling
                        if (widget.item.reasonCode != null) ...[
                          TaskDetailCell(
                            value: widget.item.reasonCode!,
                            label: 'Reason code',
                          ),
                          SizedBox(height: 16),
                        ],

                        if (widget.item.transactionCode != null) ...[
                          TaskDetailCell(
                            value: widget.item.transactionCode!.description,
                            label: 'Transaction code',
                          ),
                          SizedBox(height: 16),
                        ],

                        TaskDetailCell(
                          value: widget.item.deviceFunctioningFlag == 't'
                              ? 'Yes'
                              : 'No',
                          label: 'Device functioning flag',
                        ),
                        SizedBox(height: 16),

                        TaskDetailCell(
                          value: widget.item.engineerDepartureFlag == 't'
                              ? 'Yes'
                              : 'No',
                          label: 'Engineer departure flag',
                        ),
                        SizedBox(height: 16),
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
