import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ggiri/Screens/Dashboard/Owner/AddVehical.dart';
import 'package:ggiri/Screens/Labour/AddLabour.dart';
import 'package:ggiri/Screens/Labour/SubSubLabourwork.dart';
import 'package:ggiri/Screens/Widgets/Labour/DellabourCard.dart';
import 'package:ggiri/Screens/Widgets/Operator/Removevehical.dart';
import 'package:ggiri/Screens/Widgets/SubVehicalCard.dart';
import 'package:ggiri/Screens/Widgets/VehicalCard.dart';
import 'package:ggiri/Screens/Widgets/ViewVCard.dart';
import 'package:ggiri/Screens/Widgets/ViewVCard1.dart';
import 'package:ggiri/Screens/Port/port.dart';
import 'package:http/http.dart' as http;
class MyWorkList extends StatefulWidget {
  String status;


  MyWorkList(this.status);

  @override
  State<MyWorkList> createState() => _MyWorkListState();
}

class _MyWorkListState extends State<MyWorkList> {
  List BListItems=['Category'];
  String selected='Male';
  String bselected='Category';
  late Future _future;
  var da={};
  List de=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }
  Future<void> getdata()async{
    try{
      String url = port+"getworklist";
      var response = await http.post(
          Uri.parse(url),
          headers:{"Content-type":"application/json;charset=UTF-8"},
          body: (
              jsonEncode(  {
                "lid":"123456"
              })
          )

      );
      setState(() {
        da=json.decode(response.body);
        de=da["detail"];


      });



    }catch(error){
      EasyLoading.showToast(error.toString());
    }

  }
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
        body: Column(
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
                    Text("MY WORKLIST",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),),
                    SizedBox(height: 10,),
                    Text(de.length.toString(),style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),),

                  ],
                ),
                SizedBox(width: 100,),
                GestureDetector(onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>AddLabour("l")));
                 // Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>SubSubLabour("ADD Works")));
                },child: Padding(padding: EdgeInsets.only(right: 10),child: CircleAvatar(backgroundColor: Colors.black,radius: 20,child:Icon(Icons.add,color: Colors.white,) ,)))
              ],
            ),),)
              ,),
            SizedBox(height: 20,),
            FutureBuilder(
              future: getdata(),
              builder:(context,snapshot){

                if(de.isNotEmpty)
                {
                  return Expanded(
                    child: AlignedGridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      itemCount:de.length,
                      itemBuilder: (context, index) {
                        return  GestureDetector(onTap: (){

                        },child: Container(child: Center(
                            child:ViewWrklCard(de[index]["detail"]["img"],de[index]["detail"]["name"],de[index]["detail"]["price"],de[index]["wid"])
                        ),)
                          //ViewWrklCard(de[index]["img"],de[index]["name"],de[index]["price"])
                        ) ;
                      },
                    ),
                  );
                }
                else{
                  return Center(child:Text("Loading............") ,) ;
                }

              } ,

            )





          ],
        ),
      ),
    );
  }
}
