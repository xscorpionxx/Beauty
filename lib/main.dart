import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:new_project/Auth/Auth.dart';
import 'package:new_project/View/Home.dart';
import 'package:new_project/View/Home2.dart';
import 'package:new_project/View/Mainpage.dart';
import 'package:new_project/View/new_file1.dart';
import 'package:new_project/View/newapp1.dart';
import 'package:new_project/View/startpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Controller/getxservice.dart';
// this var i can use it from where i want because it is global
SharedPreferences? sharedPreferences ;

void main() async{
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await initialservices();
  //SharedPreferences.setMockInitialValues;
  //sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}
Future initialservices() async{
  // then we put it in the main
 await Get.putAsync(() =>Settingservice().init() );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Store',
      theme:
       ThemeData(fontFamily: 'Playfair_Display', //fontFamily: 'Poppins',
         accentColor: Color(0xffff7272) ,primaryColor: Color(0xffff7272)
      ),
      //home: Start_page(),
      initialRoute:"start_page",
      getPages: [
        GetPage(name: "/home2", page: ()=>Home2()),
        GetPage(name: "/start_page", page: ()=>Start_page()),
        GetPage(name: "/home", page:()=> Homepage() ,middlewares: [Auth()]),
        GetPage(name: "/main", page:()=> Mainpage()),
        GetPage(name: "/App", page:()=> App()),
      ],
    );
  }
}
