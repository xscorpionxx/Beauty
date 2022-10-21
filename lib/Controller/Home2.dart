import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
class Home2controller extends GetxController{
  double width = 70.0 ;
  double height = 70.0 ;
  RxDouble shape = 1.0.obs ;
  RxDouble pos = 1.0.obs ;
  List items = ["Flat@2x(1).png" ,
  "Flat@2x(2).png" ,
  "Flat@2x(3).png",
  "Flat@2x.png"];
  List items2 = ["Skin" ,
    "Skin2" ,
    "Skin3",
    "Fla"];
  List items3 = [
    {
      "img" : "images/1.png" ,
      "vol" : "200 Ml" ,
      "name" : "Gentle Skin Cleanser" ,
      "price" : r"$12.55"
    },
    {
      "img" : "images/2.png" ,
      "vol" : "200 Ml" ,
      "name" : "Gentle Skin Cleanser" ,
      "price" : r"$12.55"
    },
    {
      "img" : "images/3.png" ,
      "vol" : "200 Ml" ,
      "name" : "Gentle Skin Cleanser" ,
      "price" : r"$12.55"
    },
    {
      "img" : "images/4.png" ,
      "vol" : "200 Ml" ,
      "name" : "Gentle Skin Cleanser" ,
      "price" : r"$12.55"
    }
  ];
  RxInt currentitem = 0.obs ;
  void set_currentitem(i){
    currentitem.value =i;
    update();
  }
  RxDouble pos31 = 50.0.obs ;
  RxDouble pos32 = 50.0.obs ;
  changepos3(){
    Timer.periodic(Duration(milliseconds: 1), (timer) {
      if(pos31.value==0.0 && pos32.value==0.0){
        timer.cancel();
      }
      pos31.value = pos31.value - 1;
      pos32.value = pos32.value - 1;
      print(pos31.value+pos32.value);
    });
  }
  void changescale(){
    var timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      shape = shape + 0.2 as RxDouble;
    });
    Future.delayed(Duration(seconds: 2),(){
      timer.cancel();
      changescale2();
    });
  }
  void changescale2(){
    var timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      if(shape > 0) {
        shape = shape - 0.2 as RxDouble;
      }
    });
    var timer2 = Timer.periodic(Duration(milliseconds: 2), (timer) {
      pos = pos - 0.4 as RxDouble;
    });
    Future.delayed(Duration(seconds: 2),(){
      timer.cancel();
      timer2.cancel();
      firstpage = 0;
      update();
      changepos1();
    });
  }
  changepos1(){
    op1 = 1.obs as RxInt;
    var timer1 = Timer.periodic(Duration(milliseconds: 1), (timer) {
      pos1 = pos1 - 0.7 as RxDouble;
      if(pos1 < 0.1){
        timer.cancel();
      }
    });
    Future.delayed(Duration(seconds: 2),(){
      op2 = 1.obs as RxInt;
      update();
      var timer2 = Timer.periodic(Duration(milliseconds: 1), (timer) {
        pos2 = pos2 - 0.5 as RxDouble;
        if(pos2 < 0.1){
          timer.cancel();
        }
      });
      Future.delayed(Duration(seconds: 1),(){
        op3 = 1.obs as RxInt;
        update();
        changepos3();
      });
    });
  }
  var active_cat =0;
  change_act_cat(i){
    active_cat = i;
    update();
  }
  var firstpage = 1;
  RxDouble pos1 = 100.0.obs as RxDouble;
  RxDouble pos2 = 200.0.obs as RxDouble;
  RxInt op1 = 0.obs as RxInt ;
  RxInt op2 = 0.obs as RxInt ;
  RxInt op3 = 0.obs as RxInt ;

  var active_navbar = 0;

  set_active_navbar(val){
    active_navbar =val;
    update();
  }
  @override
  void onInit() {
    super.onInit();
  }
  @override
  void onReady() {
    changescale();
    super.onReady();
  }
}