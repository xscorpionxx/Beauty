import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:new_project/Controller/Home2.dart';
import 'package:new_project/Controller/Product.dart';
import 'package:new_project/View/Cart.dart';

class Product extends StatelessWidget{
var controller = Get.lazyPut(()=>ProductController(),fenix: true);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(body: Container(height: MediaQuery.of(context).size.height ,color: Color.fromRGBO(255, 204, 204, 0.25)
        ,child: Stack(children: [
            Positioned(child: GetBuilder<ProductController>(builder: (controller)=>
               AnimatedContainer(duration: Duration(seconds: 1),width: MediaQuery.of(context).size.width,height: controller.height,decoration: BoxDecoration(color: Color(0xffff7272
              ,) , borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30))),child: Stack(
                children:[Positioned(child: AnimatedContainer(duration: Duration(seconds: 1),height: controller.height2,width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30))),)) ,AnimatedOpacity(
                  duration: Duration(seconds: 1),opacity: controller.opacity.toDouble(),child: Container(
                    child: Column(children: [
                      Spacer(),
                       Container(margin: EdgeInsets.only(bottom: 20),width: 231,height: Get.mediaQuery.size.height*0.45,child:Stack(children: [
                           GetX<ProductController>(builder:(controller)=>
                              Container(child: Transform(transform:Matrix4.rotationZ(controller.rotateimg.value)..translate(controller.translateimgx.toDouble(),controller.translateimgy.toDouble()) ,child: AnimatedContainer(duration: Duration(milliseconds: 500),width: controller.widthimg.toDouble(),height: controller.heightimg,child: Image(image:AssetImage("images/4@2x.png") ),))))
                          ,AnimatedOpacity(duration: Duration(seconds: 1),opacity: controller.opacityimg.toDouble(),child: Container(width: 231,height: Get.mediaQuery.size.height*0.45,child: Image(image:AssetImage("images/4@2x.png") ),))
                        ],)
                      ),
                       Container(child: Text("Gentle Skin Cleanser",style: TextStyle(color: Colors.white ,fontSize: 20),),),
                       Container(margin: EdgeInsets.only(top: 5),
                         child: Row(children:[Expanded(child: Container(margin: EdgeInsets.only(right: 5),alignment: Alignment.centerRight,child: Text(r"$ 12.22",style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal,color: Colors.white),),)),
                           Expanded(child: Container(margin: EdgeInsets.only(left: 5),child: Text("200 ML",style: TextStyle(fontSize: 13,color: Colors.white),),)) ,
                         ]),
                       ),
                       Container( margin: EdgeInsets.only(left: 25,top: 15,bottom: 25,right: 25),child: Text("Formulated with pure fermented green tea extract in lieu of distilled water, TonyMoly Chok Chok Green Tea Watery Cream provides intense hydration without being sticky or too heavy on skin.",style:
                       TextStyle(color: Colors.white ,fontSize: 14),),),
      Container(margin: EdgeInsets.only(bottom: 15),child: Text("View more",style: TextStyle( decoration: TextDecoration.underline,color: Colors.white ,fontSize: 15),),),
                     ],),
                  ),
                ) ] ,
              ),),
            )),GetBuilder<ProductController>(builder: (controller)=>
              Positioned(right: 20,top: 40,child: Container(width: 125,height: 35,decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.black26,),child: Row(children: [
                 InkWell(onTap: ()=>controller.set_activebar(0),child: Container(padding: EdgeInsets.all(10),decoration: BoxDecoration(color:controller.active_bar==0? Color(0xffff7272) : null,borderRadius: BorderRadius.circular(20)),child: Text("300 Ml",style: TextStyle(color: Colors.white,fontSize: 12),),)),
                InkWell( onTap:  ()=>controller.set_activebar(1),child:Container(padding: EdgeInsets.all(10),decoration: BoxDecoration(color:controller.active_bar==1? Color(0xffff7272) : null,borderRadius: BorderRadius.circular(20)),child: Text("150 Ml",style: TextStyle(color: Colors.white,fontSize: 12),),))
              ],),)),
            ),
            Positioned(bottom: 20,child: Container(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height*0.1,child: Row(children: [
              Expanded(child: Container(margin: EdgeInsets.only(left: 30),child: Row(children: [
                Container(margin: EdgeInsets.only(left: 5,right: 5),child: Icon(Icons.remove)),
                Container(child: Text("1",style: TextStyle(fontSize:22 ),),),
                Container(margin: EdgeInsets.only(left: 5,right: 5),child: Icon(Icons.add)),
              ],),)),
              Expanded(child: Container(child: Container(alignment: Alignment.center,child: InkWell(onTap: ()=>Get.to(Cart(),transition: Transition.downToUp),child: Text("add to bag",style: TextStyle(fontSize: 20),)),),))
            ],),)),
            Positioned(bottom: -20,right: -20,
       child:  GetBuilder<ProductController>(builder:(controller)=>
            Transform.scale(scale:  controller.scales,
              child: Container(
                 width: 100,height: 100,decoration:
                   BoxDecoration(color: Colors.white,shape:BoxShape.circle),),
            ),
           ),
     ),

    ],
        )),);
  }

}