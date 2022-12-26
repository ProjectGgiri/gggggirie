import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ggiri/Screens/Dashboard/Owner/SelectVehical.dart';
import 'package:ggiri/Screens/Dashboard/Owner/WORK/WorkBooking.dart';
import 'package:ggiri/Screens/Port/port.dart';
import 'package:http/http.dart' as http;
class ViewWrklCard extends StatefulWidget {
  String img,name,price,wid;


  ViewWrklCard(this.img,this.name, this.price,this.wid);

  @override
  State<ViewWrklCard> createState() => _ViewWrklCardState();
}

class _ViewWrklCardState extends State<ViewWrklCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Container(
        height: 230,
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
                GestureDetector(onTap: (){
                  EasyLoading.show(status: "Removing..........");
                     deletdata();
                },child: Positioned(right: 30,top:10,child:Icon(Icons.highlight_remove_outlined,color: Colors.red,)))
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


          ],
        ),
      ),
    );
  }
  Future<void> deletdata()async{
    try{
      String url = port+"deletworklist";
      var response = await http.post(
          Uri.parse(url),
          headers:{"Content-type":"application/json;charset=UTF-8"},
          body: (
              jsonEncode(  {
                "lid":"123456",
                "wid":widget.wid

              })
          )

      );
      EasyLoading.showSuccess("Removed Successfully");



    }catch(error){
     print(error);
    }

  }
}
