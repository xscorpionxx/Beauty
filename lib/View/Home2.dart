import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:new_project/Controller/Home2.dart';
import 'package:new_project/View/Product.dart';
import 'package:visibility_detector/visibility_detector.dart';

class Home2 extends StatelessWidget{
 final  controller = Get.lazyPut(() =>Home2controller()) ;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var weight =  MediaQuery.of(context).size.width;
    // TODO: implement build
   return Scaffold(body:Container(color: Color.fromRGBO(255, 204, 204, 0.25),child:
   GetBuilder<Home2controller>(builder: (controller)=>
      Container(
         child: controller.firstpage==1? Stack(
               children:[ Center(
                   child: GetX<Home2controller>(
                     builder:(controller)=> Transform.translate(offset: Offset(0,double.parse(controller.pos.toString())),
                       child: Transform.scale(scale: double.parse(controller.shape.toString()),
                         child: Container( decoration: BoxDecoration(shape: BoxShape.circle
                             , color: Color(0xffff7272)),width: controller.width  ,
                           height:controller.height ,),
                       ),
                     ),
                   ),
                 ),
                  Center(
                   child: GetX<Home2controller>(builder: (controller)=>
                        Transform.translate(offset: Offset(0,double.parse(controller.pos.toString())),
                          child: Center(
                               child: Container(width: 70,height: 70,child:
                                  Image(image: AssetImage("images/Group 8@4x.png"),),
                       ),
                          ),
                        ),
                     ),
                 ),
               ],
           ) :  Container(height: height,
             child: Stack(
               children:[ SingleChildScrollView(
                 child: Column(children: [
                   Center(
                     child:  Container(margin: EdgeInsets.only(top: 30),width: 70,height: 70,decoration: BoxDecoration(shape: BoxShape.circle,color: Color(0xffff7272)),child:
                             Image(image: AssetImage("images/Group 8@4x.png"),),
                             ),
                           ),
                   GetX<Home2controller>(builder: (controller)=>
                      Transform.translate(offset: Offset(double.parse(controller.pos1.toString()),0),
                       child: AnimatedOpacity(duration: Duration(milliseconds: 200),opacity: double.parse(controller.op1.toString()),
                         child: Container(margin: EdgeInsets.only(left: 20,right: 20,top: 15),
                             padding: EdgeInsets.only(left: 10,top: 3,bottom: 3),decoration:
                         BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.white,),alignment: Alignment.center
                           ,child: TextFormField(style: TextStyle(fontSize: 15,color: Colors.black26),
                             decoration: InputDecoration(hintText:"Search product"
                                 ,hintStyle: TextStyle(fontSize: 15,color: Colors.black26),
                                 prefixIcon:Icon(Icons.search,color: Color(0xffff7272),size: 25,) ,border: InputBorder.none),
                           ),
                         ),
                       ),
                     ),
                   ),
                   GetX<Home2controller>(builder: (controller)=>
                      Transform.translate(offset: Offset(double.parse(controller.pos1.toString()),0),
                        child: AnimatedOpacity(duration: Duration(seconds: 1),opacity: double.parse(controller.op1.toString()),
                          child: Container(height: height*0.1,margin: EdgeInsets.only(left: 10,right: 10,top: 20),width: MediaQuery.of(context).size.width,child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: controller.items.length,itemBuilder: (context,i){
                           return Container(margin: EdgeInsets.only(left: 12,right: 12),decoration: BoxDecoration(color: Colors.white,
                           borderRadius: BorderRadius.circular(20)),padding: EdgeInsets.all(17) ,width: weight *0.2,child: Container(child: Image(image: AssetImage("images/"+controller.items[i]),)),);
                     }),),
                        ),
                      ),
                   ),
       GetX<Home2controller>(builder: (controller)=>
                 Transform.translate(offset: Offset(double.parse(controller.pos2.toString()),0),
                   child: AnimatedOpacity(duration: Duration(seconds: 1),opacity: double.parse(controller.op2.toString()),
                     child: Container(height: height*0.1,margin: EdgeInsets.only(left: 12,right: 12,top: 10),width: MediaQuery.of(context).size.width,child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: controller.items2.length,itemBuilder: (context,i){
                       return Container(margin: EdgeInsets.only(left: 12,right: 12) ,width: 70,child:
                       controller.active_cat == i? Text(controller.items2[i],style: TextStyle(fontSize: 16,color: Color(0xffd63434),decoration: TextDecoration.underline),)
                         : InkWell(onTap: (){
                           controller.change_act_cat(i);
                       },child: Text(controller.items2[i],style: TextStyle(fontSize: 16,color: Color(0xffffb5b5)),)));
                     }),),
                   ),
                 ),
       ) ,GetBuilder<Home2controller>(builder:(controller)=>
                    AnimatedOpacity(duration: Duration(seconds: 1),opacity: double.parse(controller.op3.toString()),
                      child: Container(margin: EdgeInsets.only(bottom: 10),height: height*0.38,child: ListView.builder( physics:BouncingScrollPhysics(),scrollDirection: Axis.horizontal,itemCount: controller.items3.length,itemBuilder: (context ,i){
                  return  GetX<Home2controller>(builder: (controller)=>
                     InkWell(onTap: (){FocusScope.of(context).unfocus(); Get.to(Product(),transition: Transition.circularReveal,duration: Duration(seconds: 1));},
                       child: Transform.translate(offset: Offset(controller.pos31.toDouble(),controller.pos32.toDouble()),
                        child: VisibilityDetector(
                            key: Key(i.toString()),
                            onVisibilityChanged: (VisibilityInfo info) {
                              var visiblePercentage = info.visibleFraction * 100;
                              if(visiblePercentage.toString()=="100.0" && controller.currentitem.value !=int.parse(info.key.toString().substring(3,4))){
                                controller.set_currentitem(int.parse(info.key.toString().substring(3,4)));
                              }
                            },
                            child: Container(width: 220,margin: EdgeInsets.only(bottom:controller.currentitem.value==i?
                                 10:20,left: 15,right: 15 ,top: controller.currentitem.value==i?
                            1:10),
                                 decoration: BoxDecoration(boxShadow: [
                                  controller.currentitem.value==i? BoxShadow(color: Colors.black12,spreadRadius: 1,blurRadius: 1,offset: Offset(15,15))
                                       :BoxShadow()
                                 ],color:Colors.white,borderRadius: BorderRadius.circular(20)),
                                child: Column(children: [
                                  Container(margin: EdgeInsets.only(top: 20),child: Text(controller.items3[i]["name"],style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),) ,
                                  Container(margin: EdgeInsets.only(top: 5),
                                    child: Row(children:[Expanded(child: Container(margin: EdgeInsets.only(right: 5),alignment: Alignment.centerRight,child: Text(controller.items3[i]["price"],style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),),)),
                                      Expanded(child: Container(margin: EdgeInsets.only(left: 5),child: Text(controller.items3[i]["vol"],style: TextStyle(fontSize: 12,),),)) ,
                                    ]),
                                  ) ,
                                  Container(width:controller.currentitem.value==i? 170:150,height:controller.currentitem.value==i?
                                   height*0.24 :  height*0.22,child: Image(image: AssetImage(controller.items3[i]["img"]),),)
                                ],),
                             ),
                        ),
                    ),
                     ),
                  ) ;
                       }),
          ),
                    ),
       )
         ],),
               ),
                 Positioned(bottom: 0,
                   child: GetBuilder<Home2controller>(builder: (controller)=>
                       Transform.translate(offset: Offset(double.parse(controller.pos1.toString()),0),
                           child: AnimatedOpacity(duration: Duration(milliseconds: 200),opacity: double.parse(controller.op2.toString()),
                             child: Container(padding: EdgeInsets.only(left: 10,right: 10),decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))),height: height*0.08,width: MediaQuery.of(context).size.width,child: Row(
                                 children: [ Expanded(flex: controller.active_navbar==0? 3 :2,
                                   child:controller.active_navbar==0? Container(height: 40,margin: EdgeInsets.only(left: 12,right: 12),decoration: BoxDecoration(color: Color(0xffff7272),
                                       borderRadius: BorderRadius.circular(20)),padding: EdgeInsets.only(left: 15) ,width: 70,child: Row(children:[
                                     Container(width: 25,height: 25,child: Icon(Icons.home_sharp,color: Colors.white,)),
                                     Container(margin: EdgeInsets.only(left: 5),child: Text("home",style: TextStyle(fontSize: 13,color: Colors.white),)),
                                   ]),) :InkWell( onTap: ()=> controller.set_active_navbar(0)
                                       ,child: Container(width: 25,height: 25,child: Container(child:Icon(Icons.home_sharp,color: Colors.black26.withOpacity(0.2),) ),)),
                                 ),
                                   Expanded(flex:controller.active_navbar==1? 3: 2,
                                     child:controller.active_navbar==1?Container(height: 40,margin: EdgeInsets.only(left: 12,right: 12),decoration: BoxDecoration(color: Color(0xffff7272),
                                         borderRadius: BorderRadius.circular(20)),padding: EdgeInsets.only(left: 15) ,width: 70,child: Row(children:[
                                       Container(width: 25,height: 25,child: Icon(Icons.people,color: Colors.white,)),
                                       Container(margin: EdgeInsets.only(left: 5),child:  Text("profile",style: TextStyle(fontSize: 13,color: Colors.white),)),
                                     ]),) :InkWell( onTap: ()=>controller.set_active_navbar(1),child: Container(width: 25,height: 25,child: Container(child: Icon(Icons.people,color: Colors.black26.withOpacity(0.2),)),)),
                                   ),
                                   Expanded(flex: controller.active_navbar==2? 3 :2,
                                     child:controller.active_navbar==2? Container(height: 40,margin: EdgeInsets.only(left: 12,right: 12),decoration: BoxDecoration(color: Color(0xffff7272),
                                         borderRadius: BorderRadius.circular(20)),padding: EdgeInsets.only(left: 15) ,width: 70,child: Row(children:[
                                       Container(width: 25,height: 25,child: Icon(Icons.send,color: Colors.white,)),
                                       Container(margin: EdgeInsets.only(left: 5),child: Text("chat",style: TextStyle(fontSize: 13,color: Colors.white),)),
                                     ]),) :InkWell( onTap: ()=>controller.set_active_navbar(2),child: Container(width: 25,height: 25,child: Container(child: Icon(Icons.send,color: Colors.black26.withOpacity(0.2),)),)),
                                   ),
                                   Expanded(flex: controller.active_navbar==3? 3 :2,
                                     child:controller.active_navbar==3? Container(height: 40,margin: EdgeInsets.only(left: 12,right: 12),decoration: BoxDecoration(color: Color(0xffff7272),
                                         borderRadius: BorderRadius.circular(20)),padding: EdgeInsets.only(left: 15) ,width: 70,child: Row(children:[
                                       Container(width: 25,height: 25,child: Icon(Icons.shopping_cart_rounded,color: Colors.white,)),
                                       Container(margin: EdgeInsets.only(left: 5),child: Text("cart",style: TextStyle(fontSize: 13,color: Colors.white),)),
                                     ]),) :InkWell( onTap: ()=>controller.set_active_navbar(3),child: Container(width: 25,height: 25,child: Container(child: Icon(Icons.shopping_cart_rounded,color: Colors.black26.withOpacity(0.2),)) ,)),
                                   ),
                                 ]
                             ),
                             ),
                           ))),
                 )],
             ),
           ),

     ),
   ),
      ) ,
   );
  }

}