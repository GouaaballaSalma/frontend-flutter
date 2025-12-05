import 'package:flutter/material.dart';
import '/pages/course_management_page.dart';
import 'pages/add_course_page.dart';
import 'pages/login_page.dart';
import 'pages/teacher_dashboard.dart';
import 'pages/add_exam.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Learning Platform',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: const Color(0xFF2463eb),
          background: const Color(0xFFf6f6f8),
          onBackground: const Color(0xFF111318),
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFF2463eb),
          background: const Color(0xFF111621),
          onBackground: Colors.white,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: const LoginPage(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/dashboard': (context) => const TeacherDashboard(),
        '/add-course': (context) => const AddCoursePage(),
        '/course-management': (context) => const CourseManagementPage(),
        '/add-exam': (context) => const CreateExamPage(),
      },
    );
  }
}