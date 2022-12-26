import 'package:flutter/material.dart';
import 'package:ggiri/Screens/Widgets/Cabs/SubCabCard.dart';
import 'package:ggiri/Screens/Widgets/SubVehicalCard.dart';
import 'package:ggiri/Screens/Widgets/VehicalCard.dart';
class AddSubCabVehical extends StatefulWidget {
  const AddSubCabVehical({Key? key}) : super(key: key);

  @override
  State<AddSubCabVehical> createState() => _AddSubCabVehicalState();
}

class _AddSubCabVehicalState extends State<AddSubCabVehical> {
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
              color: Color(0xffFFEBEB),
            ),child:
            Center(child: Text("CABS",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),),)
              ,)
            ,Padding(padding: EdgeInsets.all(20),
              child: Column(children: [
                Text("Select Vehicle From",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w600),),
                SizedBox(height: 30,),
                Row(
                  children: [
                    SubCabCard("assets/images/3.1.png","CAR"),
                    SizedBox(width: 20,),
                    SubCabCard("assets/images/3.2.png","AUTO"),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    SubCabCard("assets/images/3.3.png","BIKE"),
                    SizedBox(width: 20,),

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
