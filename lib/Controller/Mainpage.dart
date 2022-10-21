import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http ;
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:new_project/View/Home2.dart';

class Mainpagecontroller extends GetxController {
  List listcats = [
    new myview(name: "burger", url: "images/chicken@2x.png"),
    new myview(name: "pizza", url: "images/fast-food@2x.png"),
    new myview(name: "chicken", url: "images/chicken@2x.png"),
  ];
  List burgers = [
    {"name": "Zinger", "url": "images/Zinger.png"},
    {"name": "Chicken", "url": "images/Checken Burger.png"}
  ];
  int activeindex = 0;

  void choosefromlist(i) {
    activeindex = i;
    update();
  }

  int activeindex2 = 0;

  void choosefromsubcat(i) {
    alertwait();
    activeindex2 = i;
    update();
  }

  RxInt rotateangel = 0.obs;

  @override
  void onReady() {
    httpre();
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      rotateangel ++;
      ;
    });
    super.onReady();
  }

  Future httpre() async {
    if (await InternetConnectionChecker().hasConnection) {
      try {
        Get.dialog(
            AlertDialog(backgroundColor: Colors.transparent, elevation: 0,
              content: Container(height: 50, width: 50,
                child: InkWell(onTap: () {
                  Get.back();
                },
                  child: SpinKitHourGlass(color: Colors.white,
                    size: 40.0,),
                ),
              ),
            ), barrierDismissible: false
        );
        // Build out auth header
        final response = await http
            .get(Uri.parse("https://azz-app.com/api/home"))
            .timeout(Duration(seconds: 5))
            .catchError((error) {
          throw error;
        });
        // Makes sure response is okay
        if (response.statusCode == 200) {
          if(Get.isDialogOpen ==true){
            //Get.back();
          }
          return json.decode(response.body);
        }
        else {}
      } on TimeoutException catch (error) {
        if(Get.isDialogOpen ==true){
          Get.back();
        }
        Get.defaultDialog(title: "internet error try again");
      } on SocketException catch (error) {
        throw error;
      } catch (error) {
        if(Get.isDialogOpen ==true){
          Get.back();
        }
      }
    }
  else {Get.defaultDialog(title: "no internet");}
}
  alertwait() {
    if (false) {
      return Get.dialog(
          AlertDialog(backgroundColor: Colors.transparent, elevation: 0,
            content: Container(height: 50, width: 50,
              child: InkWell(onTap: () {
                Get.back();
              },
                child: SpinKitHourGlass(color: Colors.white,
                  size: 40.0,),
              ),
            ),
          ), barrierDismissible: false
      ).timeout(Duration(seconds: 5)).whenComplete(() {
        Get.back();
      });
    }
    else {

      //Get.toNamed("\home2", arguments: { "name" : "abd" });
        //Get.bottomSheet(Container( decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20),),color: Colors.white),height: 200, child: Column(children: [
        //  Container(child: Text("do you want to but this tool"),)
        //],),));
       //Get.snackbar("hi", "how are you",snackPosition: SnackPosition.BOTTOM ,
       //snackStyle: SnackStyle.GROUNDED,backgroundColor: Colors.black, colorText: Colors.white);
    }
  }
}
class myview {
  var name ;
  var url ;
  myview({this.name,this.url});
}