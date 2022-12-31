

import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ggiri/Screens/Dashboard/Owner/Dashboard/MyVehical.dart';
import 'package:ggiri/Screens/RequestlabourWidget/CompletedCard.dart';
import 'package:ggiri/Screens/RequestlabourWidget/Inprogresscard.dart';
import 'package:ggiri/Screens/RequestlabourWidget/RequestCard.dart';
import 'package:ggiri/Screens/Widgets/Labour/SwipeScreen.dart';
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
class   LabourHome extends StatefulWidget {
  String status;
  var data={};
  List d=[];


  LabourHome(this.status);

  @override
  State<LabourHome > createState() => _LabourHomeState();
}

class _LabourHomeState extends State<LabourHome > with SingleTickerProviderStateMixin {
  int selected=0;
  late TabController tabController;
  var da={};
  List de=[];

  //List images=["https://images.pexels.com/photos/1563356/pexels-photo-1563356.jpeg?auto=compress&cs=tinysrgb&w=600","https://images.pexels.com/photos/13155526/pexels-photo-13155526.jpeg?auto=compress&cs=tinysrgb&w=600"];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController=new TabController(length: 3, vsync: this);
    getdata();
  }
  Future<void> getdata()async{
    try{
      String url = port+"getban";
      var response = await http.get(
          Uri.parse(url),
          headers:{"Content-type":"application/json;charset=UTF-8"},


      );
      setState(() {
        da=json.decode(response.body);
        de=da["detail"];
      });
      EasyLoading.showToast(de.toString());
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
          children: [
            Padding(padding:EdgeInsets.all(20),child:  Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.blue,


              ),
              child:de!=null&&de.isNotEmpty? CarouselSlider.builder(itemCount:de.length, itemBuilder: (context,i,k){
                return Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(de[i]["img"]),fit: BoxFit.fill
                      )
                  ),
                );
              }, options: CarouselOptions( height: 400,
                aspectRatio: 16/9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: false,

                scrollDirection: Axis.horizontal,)):Center(child: Text("Please Wait......................"),),
            ),),
            SizedBox(height: 50,),
            Padding(padding: EdgeInsets.only(left: 10,right: 10),child: TabBar(
                controller: tabController,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,

                ),
                labelColor: Colors.white,

                unselectedLabelColor: Colors.black,
                tabs:[
                  Tab(child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.black,width: 2)
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Open"),
                    ),
                  ),),
                  Tab(child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.black,width: 2)
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("On Going"),
                    ),
                  ),),
                  Tab(child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.black,width: 2)
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Completed"),
                    ),
                  ),),
                ]),),
            SizedBox(height: 10,),
            Container(
              height: 1000,
              child: TabBarView(
                controller: tabController,
                children: [
                  SwipeScreen("O"),
                  SwipeScreen("A"),
                  SwipeScreen("C")
                 // LRequestCard(),
                  //LInProgressCard() ,
                  //labourCompletedCard()
                ],
              ),
            )


          ],
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
