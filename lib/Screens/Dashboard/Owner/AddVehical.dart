import 'package:flutter/material.dart';
import 'package:ggiri/Screens/Widgets/VehicalCard.dart';
class AddVehical extends StatefulWidget {
  String status;


  AddVehical(this.status);

  @override
  State<AddVehical> createState() => _AddVehicalState();
}

class _AddVehicalState extends State<AddVehical> {
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
            Padding(padding: EdgeInsets.all(20),
            child: Column(children: [
              Text("Select & add your vehicles here",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w600),),
              SizedBox(height: 30,),
              Row(
                children: [
                  VehicalCard(Color(0xffFFEED4),"assets/images/1.png","LAND & CONSTRUCTION",0,widget.status),
                  SizedBox(width: 20,),
                  VehicalCard(Color(0xffD1FFF4),"assets/images/2.png","AGRICULTURE",1,widget.status)
                ],
              ),
              SizedBox(height: 40,),
              VehicalCard(Color(0xffFFEBEB),"assets/images/3.png","CABS",2,widget.status),

            ],),)
          ],
        ),
      ),
    );
  }
}
