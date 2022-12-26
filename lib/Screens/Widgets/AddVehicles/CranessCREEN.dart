import 'package:flutter/material.dart';
import 'package:ggiri/Screens/Widgets/AddVehicles/Backhoewidget.dart';
import 'package:ggiri/Screens/Widgets/AddVehicles/CransWidget.dart';
import 'package:ggiri/Screens/Widgets/AddVehicles/LoaderWidget.dart';
import 'package:ggiri/Screens/Widgets/SubVehicalCard.dart';
import 'package:ggiri/Screens/Widgets/VehicalCard.dart';
import 'package:ggiri/Screens/Widgets/ViewVCard.dart';
class CRANESsCREEN extends StatefulWidget {
  String title;
  String staus;


  CRANESsCREEN (this.title,this.staus);

  @override
  State<CRANESsCREEN > createState() => _CRANESsCREENState();
}

class _CRANESsCREENState extends State<CRANESsCREEN > {
  List ListItems=["Male","Female"];
  List BListItems=["O+","A+",'B+','C+'];
  String selected='Male';
  String bselected='O+';
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
            Padding(padding: EdgeInsets.all(0),child:Container(height: 60,width: MediaQuery.of(context).size.width,decoration:BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color(0xff8FF8A300),
            ),child:
            Center(child: Text(widget.title,style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),),)
              ,),
            SizedBox(height: 20,),
            Padding(padding: EdgeInsets.only(left: 20,right: 20),child:   Row(
              children: [
                Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border.all(color:Colors.black,width: 2)
                  ),
                  child: DropdownButton(
                    hint: Text("Select",style: TextStyle(color: Colors.black),),
                    value:  selected,
                    dropdownColor: Colors.blue,
                    style: TextStyle(color: Colors.black),
                    onChanged: (value){
                      setState(() {
                        selected=value.toString();
                      });
                    },
                    items:ListItems.map((e){
                      return DropdownMenuItem(value: e
                          ,child: Padding(padding: EdgeInsets.all(10),child: Text(e,style: TextStyle(color: Colors.black),)));
                    }).toList(),

                  ),
                ),
                Spacer(),
                Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border.all(color:Colors.black,width: 2)
                  ),
                  child: DropdownButton(
                    hint: Text("Select",style: TextStyle(color: Colors.black),),
                    value:  bselected,
                    dropdownColor: Colors.blue,
                    style: TextStyle(color: Colors.black),
                    onChanged: (value){
                      setState(() {
                        bselected=value.toString();
                      });
                    },
                    items:BListItems.map((e){
                      return DropdownMenuItem(value: e
                          ,child: Padding(padding: EdgeInsets.all(10),child: Text(e,style: TextStyle(color: Colors.black),)));
                    }).toList(),

                  ),
                ),
                Spacer(),
                Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border.all(color:Colors.black,width: 2)
                  ),
                  child: DropdownButton(
                    hint: Text("Select",style: TextStyle(color: Colors.black),),
                    value:  bselected,
                    dropdownColor: Colors.blue,
                    style: TextStyle(color: Colors.black),
                    onChanged: (value){
                      setState(() {
                        bselected=value.toString();
                      });
                    },
                    items:BListItems.map((e){
                      return DropdownMenuItem(value: e
                          ,child: Padding(padding: EdgeInsets.all(10),child: Text(e,style: TextStyle(color: Colors.black),)));
                    }).toList(),

                  ),
                ),
              ],
            ),),
            SizedBox(height: 10,),
            CraneWidget("assets/images/1.5.png", "TATA Ace", "220F", "1500/Hr", "400", "6","None",widget.staus),
            CraneWidget("assets/images/1.5.png", "TATA Ace", "220F", "1500/Hr", "400", "6","None",widget.staus),
          ],
        ),
      ),
    );
  }
}
//his.img, this.com, this.model, this.price, this.capacity, this.type,this.tyre,this.feet,this.status