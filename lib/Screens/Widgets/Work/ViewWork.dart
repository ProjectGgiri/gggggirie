import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ggiri/Screens/Dashboard/Laboutr/LabourDashboard.dart';
import 'package:ggiri/Screens/Dashboard/Owner/SelectVehical.dart';
import 'package:ggiri/Screens/Dashboard/Owner/WORK/WorkBooking.dart';
import 'package:ggiri/Screens/Model/worklist.dart';
import 'package:ggiri/Screens/Port/port.dart';
import 'package:http/http.dart' as http;
class ViewWrklCard extends StatefulWidget {
  String img,name,price;
  bool isselected;
  String wid,status,type;



  ViewWrklCard(this.img,this.name, this.price,this.isselected,this.wid,this.status,this.type);

  @override
  State<ViewWrklCard> createState() => _ViewWrklCardState();
}

class _ViewWrklCardState extends State<ViewWrklCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Container(
        height: 300,
        width: 200,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      color:Color(0xffF3F3F3) ,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                ),
                Container(
                  height: 160,
                  width: 160,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.img),fit: BoxFit.fill
                      )
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Text("Name : "+widget.name,maxLines: 1,style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w800),),
            SizedBox(height: 10,),
            Row(
              children: [
                Text("Price: ",maxLines: 1,style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w800),),
                Text(widget.price,maxLines: 1,style: TextStyle(color: Colors.red,fontSize: 12,fontWeight: FontWeight.w800),),
              ],
            ),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                if(widget.isselected==false){
                  EasyLoading.show(status: "Adding to Your List");
                   addworkl();
                }

              },
              child: Container(
                height: 50,
                width: 150,
                color: Colors.black,
                child: Center(
                  child: widget.isselected? Text("Selected",maxLines: 1,style: TextStyle(color: Colors.white,fontSize: 11,fontWeight: FontWeight.w500),):
                  Text("Select",maxLines: 1,style: TextStyle(color: Colors.white,fontSize: 11,fontWeight: FontWeight.w500),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Future<void> addworkl()async{
    try{
      String url = port+"addworkl";
      var response = await http.post(
          Uri.parse(url),
          headers:{"Content-type":"application/json;charset=UTF-8"},
          body: (
              jsonEncode(  {
                "lid":"123456",
                "wid":widget.wid,
                "detail":{
                  "name": widget.name,
                  "wid":widget.wid,
                  "type": widget.type,
                  "price": widget.price,
                  "img":widget.img
                }
              })
          )

      );
      if(response.statusCode==200){
        EasyLoading.showSuccess("Added");
        if(widget.status=="a"){
          Navigator.of(context).pop();
        }else{

          Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>LabourDashboard("l")));
        }
      }




    }catch(error){
      print(error.toString());
    }

  }
}

