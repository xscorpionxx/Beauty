
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:new_project/Controller/newapp.dart';


class Newapp2 extends StatelessWidget{
 final Newappcontroller newappcontroller = Get.put(Newappcontroller());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(length: 3,
     child: Scaffold( body: Container(child: Column(children: [
       Center(child: Text("this is 2 page"),) , MaterialButton(onPressed: (){

       })]),),),

  );
  }

}
class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1>  with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        appBar: AppBar(
            title: Text("Page 1"),
            actions:<Widget>[
              IconButton(icon: Icon(Icons.ac_unit), onPressed: (){
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) =>
                        new ListViewPage()));

              })
            ]
        ),
        body: Align(
            alignment: Alignment.center,
            child: FlatButton(color: Colors.blue, textColor: Colors.white, onPressed: (){
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) =>
                      new ListViewPage()));
            }, child: Text("Switch Page - Subscribe")))
    ));
  }

  @override
  bool get wantKeepAlive => true;
}

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2>  with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        appBar: AppBar(
            title: Text("Page 2"),
            actions:<Widget>[
              IconButton(icon: Icon(Icons.ac_unit), onPressed: (){
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) =>
                        new ListViewPage()));

              })
            ]
        ),
        body: Align(
            alignment: Alignment.center,
            child: FlatButton(color: Colors.blue, textColor: Colors.white, onPressed: (){
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) =>
                      new ListViewPage()));
            }, child: Text("Switch Page - Subscribe")))
    ));
  }

  @override
  bool get wantKeepAlive => true;
}
class ListViewPage extends StatelessWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Infinite List"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(leading: Text("$index"), title: Text("Number $index"));
        },
      ),
    );
  }
}