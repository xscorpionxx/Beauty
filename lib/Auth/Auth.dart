import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:new_project/main.dart';

class Auth extends GetMiddleware{
  @override
     int ? get Priority => 2 ;
  @override
  RouteSettings ? redirect(String? route) {
    if(true) return RouteSettings(name: "main");
  }
}


class Auth2 extends GetMiddleware{
  @override
  int ? get Priority => 1;
  @override
  RouteSettings ? redirect(String? route) {
    if(true) return RouteSettings(name: "home");
  }
}