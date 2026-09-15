import 'package:flutter/material.dart';
import 'api_service.dart';
import 'task_list.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String login = 'Test_BolshakovRV';
  String password = 'E4wM75fM';

  bool isButtonEnabled() {
    return login.isNotEmpty && password.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: GestureDetector(
        onTap: () {
          // Снимаем фокус с полей ввода, чтобы скрыть клавиатуру
          FocusScope.of(context).unfocus();
        },
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              const SizedBox(height: 20),

              // 🔹 ЛОГОТИПЫ (верхняя часть)
              Column(
                children: [
                  Image.asset(
                    'assets/images/main_logo.png',
                    width: 200,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 18),
                  Image.asset(
                    'assets/images/sub_logo.png',
                    width: 120,
                    fit: BoxFit.contain,
                  ),
                ],
              ),

              const Spacer(),

              // 🔹 ПОЛЯ (центр/чуть выше центра)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 28,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        initialValue: login,
                        onChanged: (v) {
                          setState(() {
                            login = v;
                          });
                        },
                        style: const TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                          hintText: 'Login',
                          hintStyle: TextStyle(color: Colors.white70),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white38),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white70),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      TextFormField(
                        initialValue: password,
                        onChanged: (v) {
                          setState(() {
                            password = v;
                          });
                        },
                        style: const TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.white70),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white38),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white70),
                          ),
                        ),
                      ),

                      const SizedBox(height: 32),

                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isButtonEnabled()
                                ? Colors.orange
                                : Colors.grey, // Если не заполнено, серый фон
                            foregroundColor: Colors.white,
                            shape: const StadiumBorder(), // 🔥 полностью скруглённая кнопка
                          ),
                          onPressed: isButtonEnabled()
                              ? () async {
                                  final result = await ApiService.getAuthorizationHeader(
                                    login: login,
                                    password: password,
                                  );
                                  
                                  /*
                                  final items = await ApiService.fetchTasks(
                                    login: login,
                                    password: password,
                                  );*/

                                  if (!context.mounted) return;

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => TaskListScreen(token: ''), //probably wrong, but it works for now
                                    ),
                                  );
                                }
                              : null, // Если кнопка не активна, она не будет реагировать на тап
                          child: const Text('Логин'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}