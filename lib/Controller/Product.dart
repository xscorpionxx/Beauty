import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
 double scales = 20;
 var height =Get.mediaQuery.size.height*0.0;
 var opacity = 0;
 var height2 =Get.mediaQuery.size.height*0.0;
 setshape(){
  Timer.periodic(Duration(milliseconds: 8), (timer) {
    if(scales>0) {
      scales = scales - 0.1;
      print(scales);
      update();
    }
    else{
      timer.cancel();
      height = Get.mediaQuery.size.height *0.85;
      update();
      Future.delayed(Duration(seconds: 1),(){
        height2 =Get.mediaQuery.size.height *0.43;
        opacity = 1;
        update();
      });
    }
  });

}
var active_bar = 0;
 set_activebar(val){
   if(val !=active_bar) {
     active_bar = val;
     update();
     if(val==1){
       changeimag1();
     }
     else{
       changeimag2();
     }
   }
 }
 changeimag1(){
   opacityimg =0;
   update();
   Future.delayed(Duration(milliseconds:200 ) ,() {
     heightimg = Get.mediaQuery.size.height * 0.45;
     widthimg = 231;
     update();
     Timer.periodic(Duration(milliseconds: 20), (timer) {
       if(translateimgy.value>0) {
        translateimgy.value = translateimgy.value - 1.0;
       }
       if(translateimgx.value>0) {
         translateimgx.value = translateimgx.value - 10.0;

       }
       if(rotateimg.value>=0.02) {
         rotateimg.value = rotateimg.value - 0.02;
         print(rotateimg.toDouble());
       }
       Future.delayed(Duration(milliseconds: 500),(){
         timer.cancel();
       });
     });
   });
 }
 changeimag2(){
   heightimg = Get.mediaQuery.size.height * 0.3;
   widthimg = 170;
   update();
   Timer.periodic(Duration(milliseconds: 20), (timer) {
     if(translateimgy.value<10.0) {
       translateimgy.value = translateimgy.value + 1.0;
     }
     if(translateimgx.value<110.0) {
       translateimgx.value = translateimgx.value + 10.0;

     }
     if(rotateimg.value<=0.2) {
       rotateimg.value = rotateimg.value + 0.02;
       print(rotateimg.toDouble());
     }
     Future.delayed(Duration(milliseconds: 500),(){
       timer.cancel();
     });
   });
   Future.delayed(Duration(milliseconds:200 ) ,() {
     opacityimg =1;
     update();
   });
 }
 var heightimg = Get.mediaQuery.size.height * 0.3;
 var widthimg = 170;
 RxDouble translateimgx = 110.0.obs;
 RxDouble translateimgy =10.0.obs ;
 RxDouble rotateimg = 0.2.obs;
 var opacityimg = 1;
@override
  void onReady() {
  print("rea");
    setshape();
    super.onReady();
  }
}