import 'package:get/get.dart';

class Homecontroller extends GetxController{
  int state_of_page = 0;
   void change_state(){
     if(state_of_page==0){
       state_of_page =1;
     }
     else{
       state_of_page =0;
     }
     update();
   }
   bool statehoveringlogin = false;
   void onhoverlogin(val){
     statehoveringlogin = val;
     update();
   }


}