import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx/controller/education_controller.dart';
import 'package:getx/controller/experience_controller.dart';
import 'package:getx/controller/personal_controller.dart';
import 'package:getx/view/screen/form_screen.dart';
import 'package:getx/view/screen/report_screen.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const TabBarExample();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'report',
          builder: (BuildContext context, GoRouterState state) {
            return const ReportView();
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final personalcontroller = Get.put(PersonalController());
    final educationcontroller = Get.put(EducationController());
    final experiencecontroller = Get.put(ExperienceController());
    return MaterialApp.router(
      theme: ThemeData(useMaterial3: true),
      routerConfig: _router,
    );
  }
}
