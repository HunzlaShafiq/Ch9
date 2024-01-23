import 'package:ch9/main.dart';
import 'package:flutter/material.dart';

import '../admin.dart';
import '../splash.dart';
import '../studentView.dart';
import '../teacher.dart';

class RouteName{
  static const ch9 = 'main-Screen';
  static const splashScreen ='splash_Screen';
  static const studentView ='student_Screen';
  static const teacherView ='teacher_screen';
  static const adminView = 'admin_Screen';
}
class Routes {
  static Route <dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.ch9 :
        return MaterialPageRoute(builder: (context) => Ch9());

      case RouteName.splashScreen :
        return MaterialPageRoute(builder: (context) => splashScreen());

      case RouteName.studentView :
        return MaterialPageRoute(builder: (context) => studentView(data: settings.arguments as Map,));

      case RouteName.teacherView :
        return MaterialPageRoute(builder: (context) => teacherView());

      case RouteName.adminView :
        return MaterialPageRoute(builder: (context) => adminView());

      default :
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text('No Defined Page Route'),
            ),
          );
        });
    }}}
