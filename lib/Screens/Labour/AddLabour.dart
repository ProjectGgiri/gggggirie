import 'package:flutter/material.dart';
import 'package:ggiri/Screens/Widgets/Labour/LabourCard.dart';
import 'package:ggiri/Screens/Widgets/VehicalCard.dart';
class AddLabour extends StatefulWidget {
  String status;


  AddLabour(this.status);

  @override
  State<AddLabour> createState() => _AddLabourState();
}

class _AddLabourState extends State<AddLabour> {
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
                      Text("Select Works",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w600),)
                    ],
                  ),
                ),
              ),),
            SizedBox(height: 10,),
            Padding(padding: EdgeInsets.all(20),
              child: Column(children: [
                Text("Select & add Works to your list",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w600),),
                SizedBox(height: 30,),
                Text("Select Category",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w600),),
                SizedBox(height: 30,),
                Row(
                  children: [
                    LabourCard(Color(0xffFFEED4),"assets/images/00.1.png","CONSTRUCTION & HOUSING",0,widget.status),
                    SizedBox(width: 20,),
                    LabourCard(Color(0xffD1FFF4),"assets/images/00.2.png","AGRICULTURE",1,widget.status)
                  ],
                ),
                SizedBox(height: 40,),
                LabourCard(Color(0xffFFEBEB),"assets/images/00.3.png","OTHERS",2,widget.status),
              ],),)
          ],
        ),
      ),
    );
  }
}
