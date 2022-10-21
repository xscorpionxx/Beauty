import 'dart:async';

import 'package:get/get.dart';

class Cartcontroller extends GetxController{
  showitems(){
   Future.delayed(Duration(milliseconds: 300),(){
     opacity.value = 1;
     Timer.periodic(Duration(milliseconds: 15), (timer) {
       if(pos.value>0.0){
         pos.value =pos.value -20.0;
       }
       else{
         timer.cancel();
       }
     });
   });
  }
  List items = [
    {
      "img" : "images/1.png" ,
      "vol" : "200 Ml" ,
      "count" : "1",
      "name" : "Gentle Skin Cleanser" ,
      "price" : r"$12.55"
    },
    {
      "img" : "images/2.png" ,
      "vol" : "200 Ml" ,
      "count" : "5",
      "name" : "Gentle Skin Cleanser" ,
      "price" : r"$12.55"
    },
    {
      "img" : "images/3.png" ,
      "vol" : "200 Ml" ,
      "count" : "2",
      "name" : "Gentle Skin Cleanser" ,
      "price" : r"$12.55"
    },
    {
      "img" : "images/4.png" ,
      "count" : "3",
      "vol" : "200 Ml" ,
      "name" : "Gentle Skin Cleanser" ,
      "price" : r"$12.55"
    }
  ];
  RxDouble pos =200.0.obs;
  RxInt opacity = 0.obs;
  @override
  void onReady() {
    showitems();
    super.onReady();
  }
}