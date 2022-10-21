

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settingservice extends GetxService{
  late SharedPreferences sharedPreferences ;
   Future<Settingservice> init() async{
     // so here just add what you want here
      sharedPreferences = await   SharedPreferences.getInstance();
     // then dont forget to instance this in the main
      return this;
   }
}