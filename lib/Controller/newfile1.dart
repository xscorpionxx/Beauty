import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http ;
class Test1co extends GetxController{
  final base = "https://jsonplaceholder.typicode.com/posts";
  int page = 0;
  final int _limit = 20 ;
  bool isfirstrunning = false;
  bool hasnextpage = true ;
  bool isloadmorerunning = false ;
  List posts = [];
  void _firstload() async {
    isfirstrunning = true;
    update();
    try{
      final res = await http.get(Uri.parse("$base?page=$page&limit=$_limit"));
      posts = json.decode(res.body);
      update();
    }catch(err){
      if(kDebugMode){
        print("error");
      }
    }


    isfirstrunning = false;
    update();
  }

  void loadmore()async{
    print("loadmore" + page.toString());
    print(posts.length);
    if(hasnextpage == true && isfirstrunning ==false &&
    isloadmorerunning == false){
      isloadmorerunning = true;
      update();
      page +=1 ;
      try{
        final res = await http.get(Uri.parse("$base?page=$page&limit=$_limit"));
        final List fetchedposts = json.decode(res.body);
        if(fetchedposts.isNotEmpty){
          posts.addAll(fetchedposts);
          update();
        }else{
          hasnextpage = false;
          update();
        }
      }catch(err){
        if(kDebugMode){
          print("error");
        }
      }
      isloadmorerunning = false ;
      update();
    }
  }
  late ScrollController? controller ;
  @override
  void onInit() {
    super.onInit();
    _firstload();
    controller = ScrollController()..addListener(() { loadmore();});
  }
}