import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ggiri/Screens/Widgets/AddVehicles/Backhoewidget.dart';
import 'package:ggiri/Screens/Widgets/AddVehicles/Excavatorwidget.dart';
import 'package:ggiri/Screens/Widgets/SubVehicalCard.dart';
import 'package:ggiri/Screens/Widgets/VehicalCard.dart';
import 'package:ggiri/Screens/Widgets/ViewVCard.dart';
import 'package:ggiri/Screens/Port/port.dart';
import 'package:http/http.dart' as http;
class BackHoeScreen extends StatefulWidget {
  String title;
  String staus;
  String ext1,ext2;


  BackHoeScreen(this.title,this.staus,this.ext1,this.ext2);

  @override
  State<BackHoeScreen> createState() => _BackHoeScreenState();
}

class _BackHoeScreenState extends State<BackHoeScreen> {
  List ListItems=["Bucket","Breaker","LongArm","ShortArm"];
  List BListItems=["60","70",'110','200',"205","208","210","300","330","400"];
  String selected='Bucket';
  String bselected='60';
  var da={};
  List de=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }
  Future<void> filgterdata(String a,String b) async{
    try{
      String url = port+widget.ext2;
      var response = await http.post(
          Uri.parse(url),
          headers:{"Content-type":"application/json;charset=UTF-8"},
          body: (
              jsonEncode(  {
                "t":a,
                "Cap":b
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
      String url =  port+widget.ext1;
      var response = await http.get(
          Uri.parse(url),
          headers:{"Content-type":"application/json;charset=UTF-8"},
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
            Center(child: Text(widget.title.toString(),style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),),)
              ,),
            SizedBox(height: 20,),
            Padding(padding: EdgeInsets.only(left: 20,right: 20),child:   Row(
              children: [
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width/2.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border.all(color:Colors.black,width: 2)
                  ),
                  child: DropdownButton(
                    hint: Text("Select",style: TextStyle(color: Colors.black),),
                    value:  selected,
                    dropdownColor: Colors.white,
                    style: TextStyle(color: Colors.black),
                    onChanged: (value){
                      setState(() {
                        selected=value.toString();
                      });
                      setState(() {
                        de=[];
                      });
                      filgterdata(selected, bselected);
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
                  width: MediaQuery.of(context).size.width/2.5,
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
                      filgterdata(selected, bselected);
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
            de!=null?Expanded(
              child: AlignedGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                itemCount:de.length,
                itemBuilder: (context, index) {
                  return  GestureDetector(onTap: (){

                  },child: EcavatorCard(de[index]["img"], de[index]["company"], de[index]["model"],de[index]["type"],de[index]["capacity"],de[index]["price"])) ;
                },
              ),
            ):Container(child: Center(
              child: Text("Loading.............."),
            ),)



          ],
        ),
      ),
    );
  }
}
//his.img, this.com, this.model, this.price, this.capacity, this.type,this.tyre,this.feet,this.status