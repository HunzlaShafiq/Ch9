import 'package:ch9/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:RouteName.splashScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

class Ch9 extends StatefulWidget {
  const Ch9({super.key});

  @override
  State<Ch9> createState() => _Ch9State();
}

class _Ch9State extends State<Ch9> {
  final emailController =TextEditingController();
  final passwordController =TextEditingController();
  final ageController =TextEditingController();
  final usertypeController =TextEditingController();
  List<String> userType=["student","teacher","admin"];
  String usertype="student";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Email",
                prefixIcon: Icon(Icons.email),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                enabledBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "Password",
                prefixIcon: Icon(Icons.lock_outline),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                enabledBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 20,),

            TextFormField(
              controller: ageController,
              decoration: InputDecoration(
                hintText: "Age",
                prefixIcon: Icon(Icons.access_time_outlined),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                enabledBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            DropdownButtonFormField(
              value: usertype,
                items: userType.map((value) {
                  return DropdownMenuItem(
                    value: value,
                      child: Text(value));
                }).toList(),
                onChanged: (newvalue){
                setState(() {
                  usertype=newvalue!;
                });
                }

            ),
            const SizedBox(height: 20,),
            InkWell(
              onTap: ()async{
                SharedPreferences hs=await SharedPreferences.getInstance();
                hs.setString('Name', emailController.text.toString());
                hs.setString('Age', ageController.text.toString());
                hs.setString('UserType',usertype);
                hs.setBool('isLogin', true);

                if(usertype =='student')
                {
                        Navigator.pushReplacementNamed(context,RouteName.studentView,
                        arguments: {
                          'name' : "parameter"
                        }
                        );
                }
                else if (usertype =='teacher')
                {
                        Navigator.pushReplacementNamed(context, RouteName.teacherView);
                }
                else
                {

                        Navigator.pushReplacementNamed(context, RouteName.adminView);
                }

              },
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.brown,
                child:const Center(
                  child: Text(
                      "LogIn",

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


