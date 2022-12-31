import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

import '../Port/port.dart';
class LRequestCard extends StatefulWidget {

  Map data;


  LRequestCard(this.data);

  @override
  State<LRequestCard> createState() => _LRequestCardState();
}

class _LRequestCardState extends State<LRequestCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(10),
    child:Container(
      height: 400,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 3,
            spreadRadius: 5
          )
        ]

      ),
      child: Column(
        children: [
           Container(
             height: 50,
             width: MediaQuery.of(context).size.width,

             decoration: BoxDecoration(
                 color: Colors.black,
               borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight:Radius.circular(20) )
             ),
             child: Padding(
               padding: EdgeInsets.only(left: 20,right: 10),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [Text('Status :',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w900),),
                     Text(widget.data["Status"]+"PEN",style: TextStyle(color: Colors.green,fontSize: 15,fontWeight: FontWeight.w900),)],
                 ),Spacer(),Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [Text('WID:'+widget.data["wid"],style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w900),),
                     SizedBox(width: 10,),
                     Text(widget.data["Date"],style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w900),)],
                 )],
               ),
             ),

           ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,

            decoration: BoxDecoration(
                color: Color(0xffF89500),

            ),
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [Text('Request Operator',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w700),)],
              ),
            ),

          ),
          Container(
            height: 250,
            width: MediaQuery.of(context).size.width,

            decoration: BoxDecoration(
              color: Colors.white,

            ),
            child: Row(
              children: [
                Container(
                  height: 250,
                  width: 170,
                 child: Column(
                   children: [
                     Padding(padding: EdgeInsets.only(top: 20),child: Container(
                       height: 100,
                       width: 150,
                       decoration: BoxDecoration(
                           image: DecorationImage(
                               image:  NetworkImage(widget.data["detail"]["img"]),fit: BoxFit.fill
                           )
                       ),
                     ),),
                     SizedBox(height: 10,),
                     Text(widget.data["detail"]["name"],style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
                     SizedBox(height: 10,),
                     Container(height: 50,width: 100,decoration: BoxDecoration(

                       color: Color(0xffFFDA92),
                     ),child: Center(child:  Text(widget.data["detail"]["price"],maxLines: 1,style: TextStyle(color: Colors.black,fontSize: 11,fontWeight: FontWeight.w700),),)),
                   ],
                 ),
                ),
                Container(
                  height: 250,
                  width: 150,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20,right: 10),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        Text("Work Details",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
                        SizedBox(height: 10,),
                        Text("Duration",maxLines: 1,style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500),),
                        SizedBox(height: 10,),
                        Container(height: 20,width: 50,decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Color(0xff2A7E6A).withOpacity(0.3),
                        ),child: Center(child:  Text(widget.data["WorkD"]["duration"],maxLines: 1,style: TextStyle(color: Color(0xff2A7E6A),fontSize: 11,fontWeight: FontWeight.w600),),)),
                        SizedBox(height: 10,),
                        Text('Shift',maxLines: 1,style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500),),
                        SizedBox(height: 10,),
                        Container(height: 20,width: 60,decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Color(0xff2A7E6A).withOpacity(0.3),
                        ),child: Center(child: Text(widget.data["WorkD"]["Shift"],maxLines: 1,style: TextStyle(color: Color(0xff2A7E6A),fontSize: 12,fontWeight: FontWeight.w800),))),
                        SizedBox(height: 10,),
                        Text("Work District",maxLines: 1,style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w800),),
                        SizedBox(height: 10,),
                        Container(height: 20,width: 60,decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Color(0xff2A7E6A).withOpacity(0.3),
                        ),child: Center(child: Text(widget.data["WorkD"]["Workdis"],maxLines: 1,style: TextStyle(color: Color(0xff2A7E6A),fontSize: 11,fontWeight: FontWeight.w800),))),
                        SizedBox(height: 10,),
                      ],
                    ),
                  ),
                ),

              ],
            ),

          ),
          GestureDetector(
            onTap: (){
              EasyLoading.show(status: "Wait............");
              updatestatus();
            },
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,

             child:   Container(height: 50,width: 150,
               decoration: BoxDecoration(
                 color: Color(0xff7288FF),

               ),child: Center(child: Text('ACCEPT',style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.w600),),),),

            ),
          )
        ],
      ),
    ),);
  }
  Future<void> updatestatus()async{
    try{
      String url = port+"updatelabstatus";
      var response = await http.post(
          Uri.parse(url),
          headers:{"Content-type":"application/json;charset=UTF-8"},
          body: (
              jsonEncode(  {
                "wid":widget.data["wid"],
                "st":"A"
              })
          )


      );

      if(response.statusCode==200){
        EasyLoading.showSuccess("You Have Accepted The Request");
      }else{
        EasyLoading.showError("Sorry Not able to Push Your Request");
      }
    }catch(error){
      print(error.toString());
    }

  }
}
