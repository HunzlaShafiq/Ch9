import 'package:ch9/main.dart';
import 'package:ch9/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class studentView extends StatefulWidget {
  dynamic data;
  studentView({super.key,required this.data});

  @override
  State<studentView> createState() => _studentViewState();
}

class _studentViewState extends State<studentView> {
  String email='', age='',userType='';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData () async
  {
    SharedPreferences hs= await SharedPreferences.getInstance();

    email=hs.getString('Name') ?? '';
    age=hs.getString('Age') ?? '';
    userType=hs.getString('UserType')??'';
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:const Text('Student View'),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body:Padding(
        padding:const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Email :     $email'),
            const SizedBox(height: 20,),
            Text('Age :       $age'),
            const SizedBox(height: 20,),
            Text('User :       $userType'),
            const SizedBox(height: 20,),
            Text('User :       ${widget.data['name']}'),
            const SizedBox(height: 15,),
            InkWell(
              onTap: () async{
                SharedPreferences hs=await SharedPreferences.getInstance();
                hs.clear();

                Navigator.pushReplacementNamed(context, RouteName.ch9);

              },
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.brown,
                child:const Center(
                  child: Text(
                    "LogOut",

                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
