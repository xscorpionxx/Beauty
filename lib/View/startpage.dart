import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/Controller/Home.dart';
import 'package:new_project/View/Home2.dart';
import 'package:new_project/View/Mainpage.dart';

class Start_page extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      Scaffold(body: SingleChildScrollView(child: Column(children: [
        Container(height: MediaQuery.of(context).size.height,color: Color(0xffff7272).withOpacity(0.1),
          child: Stack(children:[
            Positioned(top: -172 ,left: -33,
              child: Container(width:452 ,height:
              452, decoration:
              BoxDecoration(color: Color(0xffff7272).withOpacity(1),shape: BoxShape.circle),),
            ),
            Positioned(top: 45,child: Container(width: Get.mediaQuery.size.width,height: 70,child: Image(image: AssetImage("images/Group 8@4x.png")),)),
            Positioned(right: 40,left: 40,top: 134,child:GetBuilder<Homecontroller>(
              init: Homecontroller(),builder: (controller)=>Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30),boxShadow: [BoxShadow(
                color: Colors.black12,
                blurRadius: 2.0,
                spreadRadius: 1.0,
                offset: Offset(0.5, 0.5), // shadow direction: bottom right
            )]) ,width: 316,height: MediaQuery.of(context).size.height*0.645,child:   Column(children: [
                      Container( decoration: BoxDecoration(border: Border.all(color: Colors.black12),borderRadius: BorderRadius.circular(20)),margin: EdgeInsets.only(top: 45,right: 30,left: 30), child: Row(children: [
                        Expanded(child:controller.state_of_page==0? login_active(controller) :login_inactive(controller) )
                      , Expanded(child: controller.state_of_page==0?signin_inactive(controller) : signin_active(controller) )
                      ],),)
                      ,Container(margin: EdgeInsets.only(top:controller.state_of_page==0 ?35:20),width: 227,child: TextFormField(
                        decoration: InputDecoration(focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color:Color.fromRGBO(255, 0, 54,1)),
                        ),hintText: "Enter email or username",hintStyle: TextStyle(color: Color.fromRGBO(168, 167, 167,1),fontSize:  13)),style:  TextStyle(color: Color.fromRGBO(255, 0, 54,1),fontSize:  13),),)
                      ,Container(margin: EdgeInsets.only(top: 5),width: 227,child: TextFormField(
                        decoration: InputDecoration(suffixIcon: Icon(Icons.remove_red_eye,color: Color.fromRGBO(168, 167, 167,1),size: 20,),hintText: "Password",hintStyle: TextStyle(color: Color.fromRGBO(168, 167, 167,1),fontSize:  13),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color:Color.fromRGBO(255, 0, 54,1)),
                          ),),style:  TextStyle(color: Color.fromRGBO(255, 0, 54,1),fontSize:  13)),),
                    Container(
                      child:controller.state_of_page==0 ?Container() :Container(margin: EdgeInsets.only(top: 5),width: 227,child: TextFormField(
                        decoration: InputDecoration(focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color:Color.fromRGBO(255, 0, 54,1)),
                        ),hintText: "Confirm Password",hintStyle: TextStyle(color: Color.fromRGBO(168, 167, 167,1),fontSize:  13)),style:  TextStyle(color: Color.fromRGBO(255, 0, 54,1),fontSize:  13),),),
                    )
                      ,Container(child:controller.state_of_page==1 ?Container(): Container(alignment: Alignment.centerRight,margin: EdgeInsets.only(top: 20,right: 50),child: Text("Forgot Password?",style: TextStyle(color: Color.fromRGBO(168, 167, 167,1),fontSize:  11),),)),
                    Container(margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05), width: 226,height: 45,child: ElevatedButton(onPressed: ()=>Get.to(Home2(),
                        duration: Duration(milliseconds:300 ), //duration of transitions, default 1 sec
                        transition: Transition.circularReveal), child: Text(controller.state_of_page==0? "Log In":"Sign Up",style:   TextStyle(color: Colors.white, fontSize: 14),) ,style:
                    ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color: Color(0xffff7272))
                        )
                    ),backgroundColor:MaterialStateProperty.all<Color>(Color(0xffff7272))))),
                    Spacer()
                    ,Container(alignment: Alignment.center,margin: EdgeInsets.only(top: 10),child: Text("OR",style: TextStyle(color: Color.fromRGBO(168, 167, 167,1),fontSize:  13),),),
                     Spacer()
                        ,Container(margin: EdgeInsets.only(top: 10,right: 40,left: 40),child: Row(children: [
                     Expanded(child:  Container(alignment: Alignment.centerRight,child: Container(width: 48,height: 48,decoration: BoxDecoration(border: Border.all(color: Colors.black12) , shape: BoxShape.circle),child: Image(image: AssetImage("images/twitter.png"),),))),
                       Expanded(child: Container(width: 48,height: 48,decoration: BoxDecoration(border: Border.all(color: Colors.black12) , shape: BoxShape.circle),child: Image(image: AssetImage("images/1004px-Google__.png"),),)),
                      Expanded(child:  Container(alignment: Alignment.centerLeft,child: Container(width: 48,height: 48,decoration: BoxDecoration(border: Border.all(color: Colors.black12) , shape: BoxShape.circle),child: Image(image: AssetImage("images/facebook.png"),),)))
                     ],),),Spacer(flex: 2,)
                    ],
            ),
              ),
            ) ),
          ],
          ),
        )


      ],)),);
  }
  login_active (controller){
     return  Container(width: 113,height: 29,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color(0xffff7272)),alignment: Alignment.center
  ,child: Text("Log In",style:   TextStyle(color: Colors.white, fontSize: 13),),
     );
  }
  login_inactive (controller){
    return InkWell(onTap: ()=>controller.change_state(),
      child:Container(alignment: Alignment.center,child: Text("Log In",style: TextStyle(color: Color(0xffff7272), fontSize: 13),),) ,
    );
  }
  signin_active (controller) {
    return Container(width: 113,
      height: 29,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
          color: Color(0xffff7272)),
      alignment: Alignment.center
      ,
      child: Text(
        "Sign Up", style: TextStyle(color: Colors.white, fontSize: 13),),);
  }
  signin_inactive(controller){
    return InkWell( onTap: ()=>controller.change_state(),child: Container(alignment: Alignment.center,child: Text("Sign Up",style: TextStyle(color:Color(0xffff7272), fontSize: 13),),));
  }


}