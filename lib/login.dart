import 'package:flutter/material.dart';
import 'api_service.dart';
import 'task_list.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    final keyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
    const screenShift = 60.0;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Transform.translate(
                offset: Offset(
                  0,
                  keyboardVisible ? -screenShift : 0,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 106),

                    // ЛОГОТИП
                    SvgPicture.asset(
                      'assets/images/main_logo.svg',
                      width: 115,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),

              const Spacer(),

              Transform.translate(
                offset: Offset(
                  0,
                  keyboardVisible ? -screenShift : 0,
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.66 +
                      (keyboardVisible ? screenShift : 0),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 60,
                      vertical: 40,
                    ),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(29, 71, 162, 1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 40),

                        TextFormField(
                          initialValue: login,
                          onChanged: (v) {
                            setState(() {
                              login = v;
                            });
                          },
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: SvgPicture.asset(
                                'assets/images/username.svg',
                                width: 24,
                                height: 24,
                              ),
                            ),
                            prefixIconConstraints: const BoxConstraints(
                              minWidth: 24,
                              minHeight: 24,
                            ),
                            hintText: 'Login',
                            hintStyle: const TextStyle(
                              color: Colors.white70,
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white38,
                              ),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 26),

                        TextFormField(
                          initialValue: password,
                          onChanged: (v) {
                            setState(() {
                              password = v;
                            });
                          },
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: SvgPicture.asset(
                                'assets/images/password.svg',
                                width: 24,
                                height: 24,
                              ),
                            ),
                            prefixIconConstraints: const BoxConstraints(
                              minWidth: 24,
                              minHeight: 24,
                            ),
                            hintText: 'Password',
                            hintStyle: const TextStyle(
                              color: Colors.white70,
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white38,
                              ),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ),

                        const Spacer(),

                        Transform.translate(
                          offset: Offset(
                            0,
                            keyboardVisible ? -230 : 0,
                          ),
                          child: SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: isButtonEnabled()
                                    ? const Color.fromRGBO(
                                        51,
                                        99,
                                        251,
                                        1,
                                      )
                                    : Colors.grey,
                                foregroundColor: Colors.white,
                                shape: const StadiumBorder(),
                              ),
                              onPressed: isButtonEnabled()
                                  ? () async {
                                      final result =
                                          await ApiService
                                              .getAuthorizationHeader(
                                        login: login,
                                        password: password,
                                      );

                                      if (!context.mounted) return;

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) =>
                                              TaskListScreen(token: ''),
                                        ),
                                      );
                                    }
                                  : null,
                              child: const Text('Логин'),
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}