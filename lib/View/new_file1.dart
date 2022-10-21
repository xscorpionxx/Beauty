import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/newfile1.dart';
/////// pagination
class Test1 extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:GetBuilder<Test1co>(init: Test1co(),builder: (controller)=> Container(color: Colors.white,
        child: controller.isfirstrunning?Center(child: CircularProgressIndicator(),): Column(children: [
          Expanded(child: ListView.builder(controller: controller.controller,itemCount:controller.posts.length,itemBuilder: (context,i){
            return Container(child: Text(controller.posts[i]["title"]),);
          })
          ) , if(controller.isloadmorerunning == true)
         const Padding(padding: EdgeInsets.only(top: 10 ,bottom: 10),child: Center(child: CircularProgressIndicator(),),)

        ],) ,
      )),
    );
  }

}