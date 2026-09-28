import 'package:flutter/material.dart';
import 'api_service.dart';
import 'task_cell.dart';

class TaskListScreen extends StatefulWidget {
  final String token;

  const TaskListScreen({super.key, required this.token});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<dynamic> items = [];
  bool isLoading = true;
  int type = 0;

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
      List<dynamic> result = [];

      switch (requestedType) {
        case 0:
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
            // Верхний переключатель
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 14, 14, 0),
              child: ToggleButtons(
                isSelected: [type == 0 || type == 1, type == 2],
                onPressed: (index) {
                  final newType = index == 0 ? 0 : 2;

                  if (type == newType) {
                    return;
                  }

                  setState(() {
                    type = newType;
                  });

                  loadData();
                },
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text('Заявки'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text('Инциденты'),
                  ),
                ],
              ),
            ),

            // Нижний переключатель
            if (type == 0 || type == 1)
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 10, 14, 0),
                child: ToggleButtons(
                  isSelected: [type == 0, type == 1],
                  onPressed: (index) {
                    final newType = index == 0 ? 0 : 1;

                    if (type == newType) {
                      return;
                    }

                    setState(() {
                      type = newType;
                    });

                    loadData();
                  },
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text('Инженер'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text('Сервисный центр'),
                    ),
                  ],
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
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: TaskCell(
                            item: items[index],
                            isIncident: type == 2,
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
