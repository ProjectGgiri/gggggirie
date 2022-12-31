import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ggiri/Screens/Widgets/Cabs/SecCabCard.dart';
import 'package:ggiri/Screens/Widgets/Cabs/ViewCabCard.dart';
import 'package:ggiri/Screens/Widgets/SubVehicalCard.dart';
import 'package:ggiri/Screens/Widgets/VehicalCard.dart';
import 'package:ggiri/Screens/Widgets/ViewVCard.dart';
import 'package:ggiri/Screens/Port/port.dart';
import 'package:http/http.dart' as http;
class AddSecCarCab extends StatefulWidget {
  String title,exp1,status,code;


  AddSecCarCab(this.title,this.exp1,this.status,this.code);

  @override
  State<AddSecCarCab> createState() => _AddSecCarCabState();
}

class _AddSecCarCabState extends State<AddSecCarCab> {



  var da={};
  List de=[];

  Future<void> getdata()async{
    try{
      String url =  port+widget.exp1;
      var response = await http.post(
          Uri.parse(url),
          headers:{"Content-type":"application/json;charset=UTF-8"},
          body: (
              jsonEncode(  {
                "cabt":widget.status
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
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
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
            Center(child: Text(widget.title,style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),),)
              ,),
            SizedBox(height: 10,),
            // ViewCabCard("https://s3-alpha-sig.figma.com/img/4430/a8b9/8951d85d92da9a4b8bdadc7c161aa89b?Expires=1667174400&Signature=PnglcGJtS0FJZEkbY9NylnUXqyHt4kyq7u-EKl6RcnLn9U~AcCjezOsLI-owt-jHiNAj8HQuTQSiVFync~isH4DUsGebkqs9t1bg4Qxrwb3ps58I4N~rzpY9dG7VXstZcUxaAXkWAhiPzARygudme59JbyXhZIHK3N9vHnjAifDSL7IGNtq2IxOP4j8A8F-k07CwJeEKAHa0p776zS0U67GL98zPgEANm2nynQvqahARmEJfdGYU~Y5dSZHg~wmTyRtRsqo~AAaIffib79Fe~He854wQo~xm-4wZ5Elled5T~N-tj0O~5TFEWWAtGkBjtg4JU9RDNmTETLdcj-U0bg__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",  "1500/Hr", "mini", "Hundai"),
            de!=null?Expanded(
              child: AlignedGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                itemCount:de.length,
                itemBuilder: (context, index) {
                  return  GestureDetector(onTap: (){
                    // String img,price,type,name;
                    //  String img,com,model,price,type,status,Capacity;
                  },child: SecCabCard(de[index]["img"], de[index]["price"], de[index]["cabtype"],de[index]["name"],widget.code)) ;
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
