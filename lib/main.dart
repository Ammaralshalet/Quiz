import 'package:flutqustion/config/git_it_config.dart';
import 'package:flutqustion/view/quize_app.dart';
import 'package:flutter/material.dart';
import 'package:flutqustion/view/page_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: (core.get<SharedPreferences>().getString('name') == null)
            ? const LoginPage()
            : const QuizApp());
  }
}
