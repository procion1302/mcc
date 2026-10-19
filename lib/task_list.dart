import 'package:flutter/material.dart';
import 'api_service.dart';
import 'task_cell.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'settings_list.dart';
import 'list_item.dart';
import 'task_detail.dart';
import 'incident_detail.dart';

class TaskListScreen extends StatefulWidget {
  final String token;

  const TaskListScreen({super.key, required this.token});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<ListItem> items = [];
  bool isLoading = true;
  //TODO: fix it later
  int type = 2; // 0 - engineer, 1 - service center, 2 - incidents

  // Номер текущего запроса.
  // Только последний запрос может изменить состояние экрана.
  int loadId = 0;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final int requestId = ++loadId;
    final int requestedType = type;

    setState(() {
      isLoading = true;
      items = [];
    });

    try {
      List<ListItem> result = [];

      switch (requestedType) {
        case 0:
          //TODO: fix it later
          result =
              await ApiService.fetchServiceTasks(); //await ApiService.fetchTasks();
          break;

        case 1:
          result = await ApiService.fetchServiceTasks();
          break;

        case 2:
          result = await ApiService.fetchIncidents();
          break;
      }

      // Пока запрос выполнялся, был запущен другой запрос.
      // Результат этого старого запроса больше не нужен.
      if (requestId != loadId) {
        return;
      }

      if (!mounted) {
        return;
      }

      setState(() {
        items = result;
        isLoading = false;
      });
    } catch (e) {
      print(e);

      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Ошибка загрузки: $e')));

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(49, 92, 181, 1),
        child: Column(
          children: [
            Column(
              children: [
                // Верхняя строка
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                  child: Row(
                    children: [
                      Text(
                        ApiService.user?.name ?? '',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),

                      const Spacer(),

                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  SettingsScreen(user: ApiService.user),
                            ),
                          );
                        },
                        icon: SvgPicture.asset(
                          'assets/images/settings.svg',
                          width: 28,
                          height: 28,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 14, 14, 4),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            if (type == 0 || type == 1) {
                              return;
                            }

                            setState(() {
                              type = 0;
                            });

                            loadData();
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            overlayColor: Colors.transparent,
                          ),
                          child: Text(
                            'ЗАЯВКИ',
                            style: TextStyle(
                              color: type == 0 || type == 1
                                  ? Colors.white
                                  : Color.fromRGBO(159, 179, 217, 1),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            if (type == 2) {
                              return;
                            }

                            setState(() {
                              type = 2;
                            });

                            loadData();
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            overlayColor: Colors.transparent,
                          ),
                          child: Text(
                            'ИНЦИДЕНТЫ',
                            style: TextStyle(
                              color: type == 2
                                  ? Colors.white
                                  : Color.fromRGBO(159, 179, 217, 1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Треугольник + линия
                SizedBox(
                  height: 7,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(height: 1, color: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Row(
                          children: [
                            Expanded(
                              child: type == 0 || type == 1
                                  ? Center(
                                      child: CustomPaint(
                                        size: const Size(18, 7),
                                        painter: _TrianglePainter(),
                                      ),
                                    )
                                  : const SizedBox(),
                            ),
                            Expanded(
                              child: type == 2
                                  ? Center(
                                      child: CustomPaint(
                                        size: const Size(18, 7),
                                        painter: _TrianglePainter(),
                                      ),
                                    )
                                  : const SizedBox(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            if (type == 0 || type == 1)
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 4, 14, 4),
                child: Container(
                  height: 32,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(78, 103, 154, 1),
                    borderRadius: BorderRadius.circular(17),
                  ),
                  padding: const EdgeInsets.all(3),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            if (type == 0) {
                              return;
                            }

                            setState(() {
                              type = 0;
                            });

                            loadData();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: type == 0
                                  ? Color.fromRGBO(154, 167, 199, 1)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Инженер',
                              style: TextStyle(
                                color: type == 0
                                    ? const Color.fromRGBO(22, 37, 49, 1)
                                    : Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                      ),

                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            if (type == 1) {
                              return;
                            }

                            setState(() {
                              type = 1;
                            });

                            loadData();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: type == 1
                                  ? Color.fromRGBO(154, 167, 199, 1)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Сервисный центр',
                              style: TextStyle(
                                color: type == 1
                                    ? const Color.fromRGBO(22, 37, 49, 1)
                                    : Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            // Список / загрузка
            Expanded(
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(14),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => type == 2 ? IncidentDetailScreen(item: item) : TaskDetailScreen(item: item),
                                ),
                              );
                            },
                            child: TaskCell(item: item, isIncident: type == 2),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width / 2, 0)
      ..lineTo(size.width, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
