import 'package:flutter/material.dart';
import 'package:ggiri/Screens/Dashboard/Owner/AddVehical.dart';
import 'package:ggiri/Screens/Widgets/Operator/Removevehical.dart';
import 'package:ggiri/Screens/Widgets/SubVehicalCard.dart';
import 'package:ggiri/Screens/Widgets/VehicalCard.dart';
import 'package:ggiri/Screens/Widgets/ViewVCard.dart';
import 'package:ggiri/Screens/Widgets/ViewVCard1.dart';
class MyVehicalOperator extends StatefulWidget {
  String status;


  MyVehicalOperator(this.status);

  @override
  State<MyVehicalOperator> createState() => _MyVehicalOperatorState();
}

class _MyVehicalOperatorState extends State<MyVehicalOperator> {
  List BListItems=['Category'];
  String selected='Male';
  String bselected='Category';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff3146BA),
          elevation: 0,
          actions: [
            Icon(Icons.person,color: Colors.white,size: 50,)
          ],
          leading:   Padding(
            padding: EdgeInsets.only(left: 10,bottom: 5,top: 5),
            child: Container(
              height: 50,
              width: 50,

              decoration: BoxDecoration(color: Color(0xffF89500),borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Center(child: Text("G",style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.w600),),),
            ),
          ),
        ),
        body: ListView(
          children: [
            Padding(padding: EdgeInsets.all(0),child:Container(height: 100,width: MediaQuery.of(context).size.width,decoration:BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
            ),child:
            Center(child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              Column(
                children: [
                  SizedBox(height: 20,),
                  Text("MY VEHICLES",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),),
                  SizedBox(height: 10,),
                  Text("02",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),),

                ],
              ),
                SizedBox(width: 100,),
                GestureDetector(onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>AddVehical(widget.status)));
                },child: Padding(padding: EdgeInsets.only(right: 10),child: CircleAvatar(backgroundColor: Colors.black,radius: 20,child:Icon(Icons.add,color: Colors.white,) ,)))
              ],
            ),),)
              ,),
            SizedBox(height: 20,),
            RemoveVCard("assets/images/1.5.png", "JCB", "220F", "1500/Hr", "400", "Long arm","My Vehicles"),
            RemoveVCard("assets/images/1.4.png", "JCB", "220F", "1500/Hr", "400", "Long arm","My Vehicles")
          ],
        ),
      ),
    );
  }
}
