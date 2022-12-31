import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ggiri/Screens/Dashboard/Owner/Agriculture/SelectAgri.dart';
import 'package:ggiri/Screens/Dashboard/Owner/Cabs/SelectCab.dart';
import 'package:ggiri/Screens/Dashboard/Owner/SelectVehical.dart';
import 'package:ggiri/Screens/Dashboard/User/AgricultureBook.dart';
import 'package:ggiri/Screens/Port/port.dart';
import 'package:http/http.dart' as http;
class ViewAgriCard extends StatefulWidget {
  String img,model,price,type,name;
  int code;

  ViewAgriCard(
      this.img,this.model, this.price,this.type,this.name,this.code);

  @override
  State<ViewAgriCard> createState() => _ViewAgriCardState();
}

class _ViewAgriCardState extends State<ViewAgriCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Container(
        height: 400,
        width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                      color:Color(0xffF3F3F3) ,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                ),
                Container(
                  height: 150,
                  width: 150,
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
            Text("Model : "+widget.model,maxLines: 1,style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w800),),
            SizedBox(height: 10,),
            Text("Land Type: "+widget.type,maxLines: 1,style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w800),),
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
               // Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>SelectAgri(widget.img,widget.model,widget.price, widget.type,widget.name)));
                if(widget.code==0)
                {
                  EasyLoading.show(status: "Wait.....");
                  filgterdata();
                }
               // Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>AgriBookScreen(widget.img,widget.model,widget.price, widget.type,widget.name)));
              },
              child: Container(
                height: 50,
                width: 150,
                color: Colors.black,
                child: Center(
                  child:  Text("Select",maxLines: 1,style: TextStyle(color: Colors.white,fontSize: 11,fontWeight: FontWeight.w500),),
                ),
              ),
            )
          ],
        ),
      ),

    );


  }
  Future<void> filgterdata() async{
    try{
      String url = port+"adddril";
      var response = await http.post(
          Uri.parse(url),
          headers:{"Content-type":"application/json;charset=UTF-8"},
          body: (
              jsonEncode(  {

                "did":"did123",

                "dwid": "dwid123",
                "type": "A",
                "st":"NA",
                "detail": {
                  "name": widget.name,
                  "price": widget.price,
                  "model":widget.model,
                  "tagrie":widget.type,
                  "img":widget.img
                }



              })
          )


      );
      if(response.statusCode==200){
        EasyLoading.showSuccess("All Done");
      }

    }catch(error){
      print(error.toString());
    }

  }
}
