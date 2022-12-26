import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ggiri/Screens/Dashboard/Operator/MyVehicles.dart';
import 'package:ggiri/Screens/Edit%20Profile/Editlabprofile.dart';
import 'package:ggiri/Screens/Labour/MyWorkScreen.dart';
import 'package:ggiri/Screens/Port/port.dart';
import 'package:http/http.dart' as http;
class LabourProfile extends StatefulWidget {
  const LabourProfile({Key? key}) : super(key: key);

  @override
  State<LabourProfile> createState() => _LabourProfileState();
}

class _LabourProfileState extends State<LabourProfile> {
  var data={};
  List d=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();

  }
  Future<void> getdata()async{
    try{
      String url = port+"getlabour";
      var response = await http.post(
          Uri.parse(url),
          headers:{"Content-type":"application/json;charset=UTF-8"},
          body: (
              jsonEncode(  {
                "lid":"gfddfdshhhjbhjnj"
              })
          )

      );
      setState(() {
        data=json.decode(response.body);


      });

       EasyLoading.showToast("Data uisssssssssssssssssssssssssssssssssssssssss"+data["detail"]["purl"].toString());




    }catch(error){
      print(error);
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: d!=null?ListView(
        children: [
          Container(height: 350,width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xffB9C8FF),
                  child: Padding(padding: EdgeInsets.only(left: 10,top: 10),child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      Text("My Profile",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w600),),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 150,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child: Center(
                              child:Text("Personal",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w600),),
                            ),
                          ),
                          SizedBox(width: 10,),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>MyWorkList("l")));
                            },
                            child: Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(

                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  border: Border.all(
                                      color: Colors.black,
                                      width: 2
                                  )
                              ),
                              child: Center(
                                child:Text("Works",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w600),),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=> EditLabour(data)));
                  },
                  child: Positioned(right: 20,top: 200,child:Row(
                    children: [
                      Icon(Icons.edit,color: Colors.blue,),
                      Text("Edit",style: TextStyle(color: Colors.blue,fontSize: 13,fontWeight: FontWeight.w600),)
                    ],
                  )),
                ),
                Positioned(left: 100,right: 100,top: 180,child:Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Color(0xffE7E7E7),
                      border: Border.all(color: Colors.white,width: 5),
                      borderRadius: BorderRadius.all(Radius.circular(100),),
                      image: DecorationImage(
                          image: NetworkImage(data["detail"]["purl"]),
                          fit: BoxFit.cover
                      )
                  ),

                )),

              ],
            ),),
          SizedBox(height: 10,),
          Column(
            children: [
              Text(data["detail"]["name"],style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),),
              SizedBox(height: 5,),
              Text(data["detail"]["lid"],style: TextStyle(color: Color(0xff3146BA),fontSize: 13,fontWeight: FontWeight.w600),),
              SizedBox(height: 5,),
              Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                Icon(Icons.star,color: Color(0xffF89500),),
                Icon(Icons.star,color: Color(0xffF89500)),
                Icon(Icons.star,color: Color(0xffF89500)),
                Icon(Icons.star,color: Color(0xffF89500)),
                Icon(Icons.star,color: Color(0xffF89500),)
              ],),
              SizedBox(height: 5,),
              Text("5",style: TextStyle(color: Color(0xffF89500),fontSize: 13,fontWeight: FontWeight.w600),),
              SizedBox(height: 10,),
              Container(
                height: 60,
                width: 200,
                decoration: BoxDecoration(color: Color(0xffEED682),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Center(child: Text("WORKER",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),) ,),
              )




            ],
          ),

          SizedBox(height: 20,),

          Padding(padding: EdgeInsets.all(30),child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Male",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),
                      SizedBox(height: 5,),
                      data["detail"]["gender"]?Text("Male",style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500),):Text("Female",style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500),),
                    ],
                  ),
                  Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("D.O.B",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),
                      SizedBox(height: 5,),
                      Text("10.12.2003",style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500),),
                    ],
                  )
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Blood Group",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),
                      SizedBox(height: 5,),
                      Text(data["detail"]["bgroup"],style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500),),
                    ],
                  ),
                  Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Contact",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),
                      SizedBox(height: 5,),
                      Text(data["detail"]["phone"].toString(),style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500),),
                    ],
                  )
                ],
              ),
              SizedBox(height: 20,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Address",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),
                  SizedBox(height: 5,),
                  Text(data["detail"]["address"].toString(),style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500),),
                ],
              ),
            ],
          )
          ),
          SizedBox(height: 10,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Center(
                  child:Text("DOWNLOAD ID CARD",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w600),),
                ),
              )
            ],
          ),
          SizedBox(height: 10,),

        ],
      ):Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
