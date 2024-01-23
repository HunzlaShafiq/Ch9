import 'dart:async';

import 'package:ch9/admin.dart';
import 'package:ch9/studentView.dart';
import 'package:ch9/main.dart';
import 'package:ch9/teacher.dart';
import 'package:ch9/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splashScreen extends StatefulWidget {
  static const String id= 'splash_Screen';
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin();
  }
  void isLogin() async
  {
    SharedPreferences hs=await SharedPreferences.getInstance();
    bool isLogin = hs.getBool('isLogin') ?? false;
    String userType= hs.getString('UserType') ?? '';
    if(isLogin)
      {
        if(userType=='student')
          {
         Timer(Duration(seconds: 4),
                 () {
           Navigator.pushReplacementNamed(context, RouteName.studentView);
                 }
         );
          }
        else if (userType=='teacher')
          {
            Timer(Duration(seconds: 4),
                    () {
                  Navigator.pushReplacementNamed(context, RouteName.teacherView);
                }
            );
          }
        else
          {
            Timer(Duration(seconds: 5),
                    () {
                  Navigator.pushReplacementNamed(context, RouteName.adminView);
                }
            );
          }
      }
    else
      {
        Timer(Duration(seconds: 5),
                () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Ch9()));
            }
        );

      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset('asserts/splash.jpeg',
          fit: BoxFit.fill,
        height: double.infinity,
      ),
    );
  }
}
