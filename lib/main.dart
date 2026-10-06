import 'package:flutter/material.dart';
import 'login.dart';
import 'settings_list.dart';
import 'account_cell.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      home: const SettingsScreen(user: User(name: 'John Doe', company: 'Acme Inc.')),
    );
  }
}
