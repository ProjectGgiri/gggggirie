import 'package:flutter/material.dart';
import 'package:ggiri/Screens/Dashboard/Owner/AddVehical.dart';
import 'package:ggiri/Screens/Widgets/SubVehicalCard.dart';
import 'package:ggiri/Screens/Widgets/VehicalCard.dart';
import 'package:ggiri/Screens/Widgets/ViewVCard.dart';
import 'package:ggiri/Screens/Widgets/ViewVCard1.dart';
class MyVehical extends StatefulWidget {
  String status;


  MyVehical(this.status);

  @override
  State<MyVehical> createState() => _MyVehicalState();
}

class _MyVehicalState extends State<MyVehical> {
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
            Padding(padding: EdgeInsets.all(0),child:Container(height: 60,width: MediaQuery.of(context).size.width,decoration:BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color(0xff8FF8A300),
            ),child:
            Center(child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("MY VEHICLES",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
                SizedBox(width: 100,),
                GestureDetector(onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>AddVehical(widget.status)));
                },child: Padding(padding: EdgeInsets.only(right: 10),child: CircleAvatar(backgroundColor: Colors.black,radius: 20,child:Icon(Icons.add,color: Colors.white,) ,)))
              ],
            ),),)
              ,),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 150,
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
            ),
            SizedBox(height: 20,),
            ViewVehicalCard1("assets/images/1.5.png", "JCB", "220F", "1500/Hr", "400", "Long arm","My Vehicles"),
            ViewVehicalCard1("assets/images/1.4.png", "JCB", "220F", "1500/Hr", "400", "Long arm","My Vehicles")
          ],
        ),
      ),
    );
  }
}
