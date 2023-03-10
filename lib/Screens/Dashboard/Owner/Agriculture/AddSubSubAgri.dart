import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ggiri/Screens/Widgets/Agriculture/ViewAgriCard.dart';
import 'package:ggiri/Screens/Widgets/Cabs/ViewCabCard.dart';
import 'package:ggiri/Screens/Widgets/SubVehicalCard.dart';
import 'package:ggiri/Screens/Widgets/VehicalCard.dart';
import 'package:ggiri/Screens/Widgets/ViewVCard.dart';
import 'package:ggiri/Screens/Port/port.dart';
import 'package:http/http.dart' as http;
class AddSubSubAgri extends StatefulWidget {
  String title,tag;
  int Selected,code;


  AddSubSubAgri (this.title,this.tag,this.Selected,this.code);

  @override
  State<AddSubSubAgri > createState() => _AddSubSubAgriState();
}

class _AddSubSubAgriState extends State<AddSubSubAgri > {
  List<List<String>> li=[["Dry Land","Wet Land"],["Ground Nut","Maize","Rice"],["Pump","Tractor","Drone"],["Ground Nut","Rice","Sun Flower","Redgrames","Maize"]];
  String bselected='Dry Land';
  var da={};
  List de=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
     bselected=li[widget.Selected][widget.Selected];
    });
    getdata();
  }
  Future<void> filgterdata(String a) async{
    try{
      String url = port+"gettypef";
      var response = await http.post(
          Uri.parse(url),
          headers:{"Content-type":"application/json;charset=UTF-8"},
          body: (
              jsonEncode(  {
                "t":a,
                "tag":widget.tag
              })
          )


      );
      setState(() {
        da=json.decode(response.body);
        de=da["detail"];
      });


    }catch(error){
      print(error.toString());
    }

  }
  Future<void> getdata()async{
    try{
      String url =  port+"gettype";
      var response = await http.post(
        Uri.parse(url),
        headers:{"Content-type":"application/json;charset=UTF-8"},
          body: (
              jsonEncode(  {
                "ta":widget.tag
              })
          )
      );
      setState(() {
        da=json.decode(response.body);
        de=da["detail"];
        EasyLoading.showToast(de.toString());
      });


    }catch(error){
      print(error.toString());
    }

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
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
                          Text(li[0][0].toString(),style: TextStyle(color: Color(0xff3A2AFA),fontSize: 40,fontWeight: FontWeight.w600),)
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
                    dropdownColor: Colors.white,
                    style: TextStyle(color: Colors.black),
                    onChanged: (value){
                      setState(() {
                        bselected=value.toString();
                      });
                      setState(() {
                        de=[];
                      });
                      filgterdata(bselected);
                    },
                    items:li[widget.Selected].map((e){
                      return DropdownMenuItem(value: e
                          ,child: Padding(padding: EdgeInsets.all(10),child: Text(e,style: TextStyle(color: Colors.black),)));
                    }).toList(),

                  ),
                ),


              ],
            ),),
            SizedBox(height: 10,),
            de!=null?Expanded(
              child: AlignedGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                itemCount:de.length,
                itemBuilder: (context, index) {
                  return  GestureDetector(onTap: (){
                    //  String img,com,model,price,type,status,Capacity;
                  },child: ViewAgriCard(de[index]["img"], de[index]["model"],de[index]["price"],de[index]["type"],de[index]["name"],0)) ;
                },
              ),
            ):Container(child: Center(
              child: Text("Loading.............."),
            ),)
            //ViewAgriCard("https://images.pexels.com/photos/207247/pexels-photo-207247.jpeg?auto=compress&cs=tinysrgb&w=600", "220F", "220F ","wet" ,"Agro 3 lane"),

          ],
        ),
      ),
    );
  }
}
