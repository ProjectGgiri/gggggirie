

import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ggiri/Screens/Dashboard/Owner/Dashboard/MyVehical.dart';
import 'package:ggiri/Screens/RequestlabourWidget/CompletedCard.dart';
import 'package:ggiri/Screens/RequestlabourWidget/Inprogresscard.dart';
import 'package:ggiri/Screens/RequestlabourWidget/RequestCard.dart';
import 'package:ggiri/Screens/Widgets/Operator/OnGoing.dart';
import 'package:ggiri/Screens/Widgets/Operator/OpenRequest.dart';
import 'package:ggiri/Screens/Widgets/Operator/OperatorComp.dart';
import 'package:ggiri/Screens/Widgets/RequestWidget/CompletedCard.dart';
import 'package:ggiri/Screens/Widgets/RequestWidget/Inprogresscard.dart';
import 'package:ggiri/Screens/Widgets/RequestWidget/RequestCard.dart';
import 'package:ggiri/Screens/Widgets/SubVehicalCard.dart';
import 'package:ggiri/Screens/Widgets/Vcard.dart';
import 'package:ggiri/Screens/Widgets/VehicalCard.dart';
import 'package:ggiri/Screens/Widgets/ViewVCard1.dart';
import 'package:ggiri/Screens/Port/port.dart';
import 'package:http/http.dart' as http;
class   SwipeScreen extends StatefulWidget {
String status;


SwipeScreen(this.status);

  @override
  State<SwipeScreen > createState() => _SwipeScreenState();
}

class _SwipeScreenState extends State<SwipeScreen > {
  int selected=0;
  late TabController tabController;
  var da={};
  List de=[];

  //List images=["https://images.pexels.com/photos/1563356/pexels-photo-1563356.jpeg?auto=compress&cs=tinysrgb&w=600","https://images.pexels.com/photos/13155526/pexels-photo-13155526.jpeg?auto=compress&cs=tinysrgb&w=600"];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getdata();
  }
  Future<void> getdata()async{
    try{
      String url = port+"getlabreqst";
      var response = await http.post(
        Uri.parse(url),
        headers:{"Content-type":"application/json;charset=UTF-8"},
          body: (
              jsonEncode(  {
                "st":widget.status
              })
          )


      );
      setState(() {
        da=json.decode(response.body);
        de=da["detail"];
      });

  
    }catch(error){
      print(error.toString());
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children:List.generate(de.length, (index){
            if(widget.status=="O"){
              return LRequestCard(de[index]);
            }else if(widget.status=="A"){
              return LInProgressCard(de[index]);
            }else{
              return labourCompletedCard(de[index]);
            };
          }),
        ),
      ),
    );
  }
  Widget dots(int active){
    return ListView.builder(scrollDirection: Axis.horizontal,itemBuilder:(BuildContext context,int index){
      return Container(
        height: 30,
        width: 30,
        color: active==index?Colors.black:Colors.grey,
      )  ;

    },itemCount:de.length);
  }
}
