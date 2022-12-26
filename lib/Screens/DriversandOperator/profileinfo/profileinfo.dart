import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ggiri/Screens/Dashboard/Owner/Welcome.dart';
class ProfileinfoDriver extends StatefulWidget {
  String status;


  ProfileinfoDriver(this.status);

  @override
  State<ProfileinfoDriver> createState() => _ProfileinfoDriverState();
}

class _ProfileinfoDriverState extends State<ProfileinfoDriver> {
  List ListItems=["Male","Female"];
  File? file=null;
  List BListItems=["O+","A+",'B+','C+'];
  String selected='Male';
  String bselected='O+';
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:Scaffold(
      body: ListView(
        children: [
          Container(height: 350,width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Container(
                  height: 250,
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
                        Text("Profile info",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w600),)
                      ],
                    ),
                  ),
                ),
                Positioned(left: 100,right: 100,top: 180,child:Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Color(0xffE7E7E7),
                      border: Border.all(color: Colors.white,width: 5),
                      borderRadius: BorderRadius.all(Radius.circular(100),)
                  ),
                  child: Center(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.camera_alt_outlined,size: 60,),
                      SizedBox(height: 10,),
                      Text("UPLOAD",style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.w600),)

                    ],
                  ),),
                ))
              ],
            ),),
          SizedBox(height: 10,),
          Padding(padding: EdgeInsets.only(left: 20,right: 20),child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 10,),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("D.0.B",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                      SizedBox(height: 10,),
                      Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(color:Colors.black,width: 2)
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: TextField(
                            cursorColor: Colors.grey,
                            style: TextStyle(color: Colors.black),
                            keyboardType:TextInputType.text,
                            onChanged: (value){
                              setState(() {

                              });
                            },
                            maxLines: 50,
                            decoration: InputDecoration(
                              focusColor: Colors.white,
                              hintText:"10/12/2003",
                              hintStyle: TextStyle(color: Colors.black),
                              border:InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 10,),


                ],
              ),
              SizedBox(height: 10,),
              Text("ID Verification",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
              SizedBox(height: 10,),
              Text("1. If you are a driver upload Driving license",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400),),
              SizedBox(height: 5,),
              Text("2. If you are just an operator upload aadhar ",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400),),
              SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.all(0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Column(children: [
                          Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(color: Color(0xffE7E7E7),borderRadius: BorderRadius.all(Radius.circular(10))),
                            child: Center(
                              child: Icon(Icons.camera_alt_outlined),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text("Front",style: TextStyle(color: Colors.black,fontSize: 13,),),
                        ],),
                        Spacer(),
                        Column(children: [
                          Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(color: Color(0xffE7E7E7),borderRadius: BorderRadius.all(Radius.circular(10))),
                            child: Center(
                              child: Icon(Icons.camera_alt_outlined),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text("Back",style: TextStyle(color: Colors.black,fontSize: 13),),
                        ],),


                      ],
                    ),
                    SizedBox(height: 10,),


                  ],
                ),
              ),
              SizedBox(height: 10,),
              Row(children: [
                Column(
                  children: [
                    Text("Blood Group",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                    SizedBox(height: 10,),
                    Container(
                      height: 50,
                      width: 100,
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
                ),Spacer(), Column(
                  children: [
                    Text("Gender",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                    SizedBox(height: 10,),
                    Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(color:Colors.black,width: 2)
                      ),
                      child: DropdownButton(
                        hint: Text("Select",style: TextStyle(color: Colors.black),),
                        value:  selected,
                        dropdownColor: Colors.blue,
                        style: TextStyle(color: Colors.black),
                        onChanged: (value){
                          setState(() {
                            selected=value.toString();
                          });
                        },
                        items:ListItems.map((e){
                          return DropdownMenuItem(value: e
                              ,child: Padding(padding: EdgeInsets.all(10),child: Text(e,style: TextStyle(color: Colors.black),)));
                        }).toList(),

                      ),
                    ),
                  ],
                ),
              ],),

              SizedBox(height: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Address",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                  SizedBox(height: 10,),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(color:Colors.black,width: 2)
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: TextField(
                        cursorColor: Colors.grey,
                        style: TextStyle(color: Colors.black),
                        keyboardType:TextInputType.text,
                        onChanged: (value){
                          setState(() {

                          });
                        },
                        maxLines: 50,
                        decoration: InputDecoration(
                          focusColor: Colors.white,
                          hintText:"HO/No Street",
                          hintStyle: TextStyle(color: Colors.black),
                          border:InputBorder.none,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 20,),
              Row(


                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("State",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                      SizedBox(height: 10,),
                      Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(color:Colors.black,width: 2)
                        ),
                        child: DropdownButton(
                          hint: Text("Select",style: TextStyle(color: Colors.black),),
                          value:  selected,
                          dropdownColor: Colors.blue,
                          style: TextStyle(color: Colors.black),
                          onChanged: (value){
                            setState(() {
                              selected=value.toString();
                            });
                          },
                          items:ListItems.map((e){
                            return DropdownMenuItem(value: e
                                ,child: Padding(padding: EdgeInsets.all(10),child: Text(e,style: TextStyle(color: Colors.black),)));
                          }).toList(),

                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 10,),
                  Column(

                    children: [
                      Text("District",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                      SizedBox(height: 10,),
                      Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(color:Colors.black,width: 2)
                        ),
                        child: DropdownButton(
                          hint: Text("Select",style: TextStyle(color: Colors.black),),
                          value:  selected,
                          dropdownColor: Colors.blue,
                          style: TextStyle(color: Colors.black),
                          onChanged: (value){
                            setState(() {
                              selected=value.toString();
                            });
                          },
                          items:ListItems.map((e){
                            return DropdownMenuItem(value: e
                                ,child: Padding(padding: EdgeInsets.all(10),child: Text(e,style: TextStyle(color: Colors.black),)));
                          }).toList(),

                        ),
                      ),
                    ],
                  ),

                ],
              ),
              SizedBox(height: 20,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Pincode",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                  SizedBox(height: 10,),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(color:Colors.black,width: 2)
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: TextField(
                        cursorColor: Colors.grey,
                        style: TextStyle(color: Colors.black),
                        keyboardType:TextInputType.text,
                        onChanged: (value){
                          setState(() {

                          });
                        },
                        maxLines: 50,
                        decoration: InputDecoration(
                          focusColor: Colors.white,
                          hintText:"102345",
                          hintStyle: TextStyle(color: Colors.black),
                          border:InputBorder.none,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 20,),

            ],
          ),),
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.only(left: 50,right: 50),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>OwnWelcome(widget.status)));
              },
              child: Container(height: 60,width: 200,
                decoration:  BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.black,width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Center(
                  child: Text("NEXT",style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.w900),),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
        ],
      ),
    ));
  }
}
