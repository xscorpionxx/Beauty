import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';



class Location extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {

    return staty();

  }
}
class staty extends State<Location>{

  //late LatLng latLng ;
  var newLat;
  //Set<Marker> _marker = {};
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(title: Text("Location"),),
        body: Container(child:
        Column(children: [Container(padding: EdgeInsets.only(left: 10,right: 10)
            ,decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent,width: 7)),child: Text('',style: TextStyle(fontSize: 25),)),Container( height:MediaQuery.of(context).size.height * 0.6,child:Container())
      //  GoogleMap(initialCameraPosition:CameraPosition(target:latLng,zoom: 10) ,markers:_marker
       //   ,onTap: (latLn){
       ///     _marker.clear();
      //      _marker.add(Marker(markerId: MarkerId("d"),position: latLn) );
      ///      newLat = latLn;
      //      setState(() {
      //      });
        //  },)),
            ,
        //  ElevatedButton(onPressed: (){

          //}, child: Text("choose")),
        ]
        )
     )
    );
  }


}