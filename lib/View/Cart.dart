import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:new_project/Controller/Cart.dart';

class Cart extends StatelessWidget{
 var controller = Get.lazyPut(() => Cartcontroller());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(body: Container(child:
      Column(children: [
        Container(height: Get.mediaQuery.size.height*0.87,width: Get.mediaQuery.size.width,decoration: BoxDecoration(color: Color(0xffff7272),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))),child:
          Column(children: [
            Directionality(textDirection: TextDirection.rtl,child:
            Container(margin: EdgeInsets.only(top: 40,right: 20,bottom: 10),child:Row(children: [Text(r"55.88 $",style: TextStyle(color: Colors.white,fontSize: 21),),
              Text(" total",style: TextStyle(color: Colors.white,fontSize: 15),) ,], ))),
            GetX<Cartcontroller>(builder: (controller)=>
               Transform.translate(offset: Offset(controller.pos.toDouble(),0),
                 child: AnimatedOpacity(duration: Duration(milliseconds: 800),opacity: controller.opacity.toDouble(),
                   child: Container(height: Get.mediaQuery.size.height*0.5,width: MediaQuery.of(context).size.width,child: ListView.builder(physics: BouncingScrollPhysics(),itemCount: controller.items.length,itemBuilder: (context,i){
                    return Container(margin: EdgeInsets.only(top: 15,right: 15,left: 15),child: Row(children: [
                      Expanded(flex: 2,child: Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),width: 70,height: 120,padding: EdgeInsets.only(top: 20,bottom: 20,right: 10,left: 10),child: Image(image: AssetImage(controller.items[i]["img"]),))),
                      Expanded(flex: 5,child: Container(child: Column(children: [
                        Container(child: Text(controller.items[i]["count"] +"*" +controller.items[i]["name"],style: TextStyle(color: Colors.white,fontSize: 18),),),
                        Container(margin: EdgeInsets.only(top: 5),
                          child: Row(children:[Expanded(child: Container(margin: EdgeInsets.only(right: 5),alignment: Alignment.centerRight,child: Text(controller.items[i]["price"],style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.normal),),)),
                            Expanded(child: Container(margin: EdgeInsets.only(left: 5),child: Text(controller.items[i]["vol"],style: TextStyle(fontSize: 14,color: Colors.white),),)) ,
                          ]),
                        ) ,
                      ],)))
                    ],),);
              }),),
                 ),
               ),
            ),
            Container(margin: EdgeInsets.only(top: 10),decoration: BoxDecoration(border: Border.all(color: Colors.white)),padding: EdgeInsets.only(top:10,bottom: 10,
            left: 100,right: 100),child: Text("apply Coupon",style: TextStyle(color: Colors.white,fontSize: 18),),),
            Directionality(textDirection: TextDirection.rtl,child:
            Container(margin: EdgeInsets.only(top: 20,right: 20),child:Row(children: [Text(r"55.88 $",style: TextStyle(color: Colors.white,fontSize: 21),),
              Text("total",style: TextStyle(color: Colors.white,fontSize: 15),) ,], ))),
            Directionality(textDirection: TextDirection.rtl,
              child: Container(margin: EdgeInsets.only(top: 20,right: 20),child:Row(children: [Text(r"00.88 $",style: TextStyle(color: Colors.white,fontSize: 21),),
                Text(" tax",style: TextStyle(color: Colors.white,fontSize: 15),) ,], )),
            ),
          ],)
        ,),Spacer(),
        Container(child: Text("Continue",style: TextStyle(fontSize: 19),),)
        ,Spacer()
      ],),));
  }

}