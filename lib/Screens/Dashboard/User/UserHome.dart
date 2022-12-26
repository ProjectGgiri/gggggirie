

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ggiri/Screens/Dashboard/Owner/Dashboard/MyVehical.dart';
import 'package:ggiri/Screens/Widgets/SubVehicalCard.dart';
import 'package:ggiri/Screens/Widgets/User/UserCard.dart';
import 'package:ggiri/Screens/Widgets/Vcard.dart';
import 'package:ggiri/Screens/Widgets/VehicalCard.dart';
class  UserHome extends StatefulWidget {
  String status;


  UserHome(this.status);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  int selected=0;
  List images=["https://images.pexels.com/photos/1563356/pexels-photo-1563356.jpeg?auto=compress&cs=tinysrgb&w=600","https://images.pexels.com/photos/13155526/pexels-photo-13155526.jpeg?auto=compress&cs=tinysrgb&w=600"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(padding:EdgeInsets.all(20),child:  Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.blue,


            ),
            child: CarouselSlider.builder(itemCount:images.length, itemBuilder: (context,i,k){
              return Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(images[i]),fit: BoxFit.fill
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

              scrollDirection: Axis.horizontal,)),
          ),),
          SizedBox(height: 10,),

          Padding(padding:EdgeInsets.only(left: 100),child: Text("Select a service u want",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w700),)),
          SizedBox(height: 20,),
         Padding(padding: EdgeInsets.only(left: 20),child:  Column(
           children: [
             Row(
               children: [
                 UserCard(Color(0xffFFEED4),"assets/images/1.png","LAND & CONSTRUCTION",0,widget.status),
                 SizedBox(width: 20,),
                 UserCard(Color(0xffD1FFF4),"assets/images/2.png","AGRICULTURE",1,widget.status),
               ],
             ),
             SizedBox(height: 10,),
             Row(
               children: [
                 UserCard(Color(0xffFFEBEB),"assets/images/3.png","CABS",2,widget.status),
                 SizedBox(width: 20,),
                 UserCard(Color(0xffEFEEFF),"assets/images/worker.png","WORK",3,widget.status),
               ],
             )
           ],
         )
           ,)

        ],
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

    },itemCount:images.length);
  }
}
