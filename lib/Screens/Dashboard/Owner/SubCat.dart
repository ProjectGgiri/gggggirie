import 'package:flutter/material.dart';
import 'package:ggiri/Screens/Widgets/SubVehicalCard.dart';
import 'package:ggiri/Screens/Widgets/VehicalCard.dart';
class AddSubVehical extends StatefulWidget {
 String status;


 AddSubVehical(this.status);

  @override
  State<AddSubVehical> createState() => _AddSubVehicalState();
}

class _AddSubVehicalState extends State<AddSubVehical> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Container(height: 200,width: MediaQuery.of(context).size.width,
              child:Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                color: Color(0xffB9C8FF),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 60,
                            width: 60,

                            decoration: BoxDecoration(color: Color(0xffF89500),borderRadius: BorderRadius.all(Radius.circular(30))),
                            child: Center(child: Text("G",style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.w600),),),
                          ),
                          SizedBox(width: 5,),
                          Text("giri",style: TextStyle(color: Color(0xff3A2AFA),fontSize: 40,fontWeight: FontWeight.w600),)
                        ],
                      ),
                      SizedBox(height: 50,),
                      Text("Add Vehicle",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w600),)
                    ],
                  ),
                ),
              ),),
            SizedBox(height: 10,),
            Padding(padding: EdgeInsets.all(20),child:Container(height: 60,width: MediaQuery.of(context).size.width,decoration:BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color(0xff8FF8A300),
            ),child:
              Center(child: Text("LAND & CONSTRUCTION",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),),)
              ,)
            ,Padding(padding: EdgeInsets.all(20),
            child: Column(children: [
              Text("Select Vehicle From",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w600),),
              SizedBox(height: 30,),
              Row(
                children: [
                  SubVehicalCard("assets/images/1.1.png","EXCAVATORS",widget.status,"e"),
                  SizedBox(width: 20,),
                  SubVehicalCard("assets/images/1.2.png","BACKHOE",widget.status,"b"),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  SubVehicalCard("assets/images/1.3.png","LOADERS",widget.status,"l"),
                  SizedBox(width: 20,),
                  SubVehicalCard("assets/images/1.4.png","COMPACTORS",widget.status,"c"),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  SubVehicalCard("assets/images/1.5.png","DOZERS",widget.status,"d"),
                  SizedBox(width: 20,),
                  SubVehicalCard("assets/images/1.6.png","CRANES",widget.status,"c"),
                ],
              )
            ],),)
          ],
        ),
      ),
    );
  }
}
