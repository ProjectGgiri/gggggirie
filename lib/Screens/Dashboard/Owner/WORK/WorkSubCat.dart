import 'package:flutter/material.dart';
import 'package:ggiri/Screens/Widgets/SubVehicalCard.dart';
import 'package:ggiri/Screens/Widgets/VehicalCard.dart';
import 'package:ggiri/Screens/Widgets/Work/SubWorkCard.dart';
class WorkSubVehical extends StatefulWidget {
  const WorkSubVehical({Key? key}) : super(key: key);

  @override
  State<WorkSubVehical> createState() => _WorkSubVehicalState();
}

class _WorkSubVehicalState extends State<WorkSubVehical> {
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
            Padding(padding: EdgeInsets.all(20),child:Container(height: 60,width: MediaQuery.of(context).size.width,decoration:BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color(0xffEFEEFF),
            ),child:
              Center(child: Text("LABOUR WORKS",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),),)
              ,)
            ,Padding(padding: EdgeInsets.all(20),
            child: Column(children: [
              Text("Select Work From",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w600),),
              SizedBox(height: 30,),
              Row(
                children: [
                  SubWorkCard("assets/images/2.1.png","CONSTRUCTION WORKS"),
                  SizedBox(width: 20,),
                  SubWorkCard("assets/images/2.2.png","AGRICULTURE WORKS"),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  SubWorkCard("assets/images/2.3.png","OTHER WORKS"),

                ],
              ),
              SizedBox(height: 20,),

            ],),)
          ],
        ),
      ),
    );
  }
}
