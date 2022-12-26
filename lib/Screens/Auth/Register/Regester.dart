import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ggiri/Screens/Auth/Register/Registerotp.dart';
import 'package:ggiri/Screens/Port/port.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {


  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  List ListItems=["VEHICLE OWNER","USER","DRIVER/ OPERATOR","LABOURS"];
  String selected='VEHICLE OWNER';

  String ?fullname,mobileno;

  late String error;
  late String number;
  late String phone;
  String sel="vo";
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:Scaffold(
      body: ListView(
        children: [
          Padding(padding:EdgeInsets.only(left: 80,),child: Container(
            height: 250,
            width: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/circle.png"),fit: BoxFit.fill
                )
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 50,),
                  Text("Ggiri",style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.w600),),
                  SizedBox(height: 10,),
                  Text("Connecting People.",style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w600),)
                ],
              ),
            ),
          )),
          Padding(
            padding: EdgeInsets.only(left: 30,top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Register",style: TextStyle(color: Colors.black,fontSize: 36,fontWeight: FontWeight.w400),),
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border.all(color:Colors.black,width: 2)
                  ),
                  child:Center(
                    child: Padding(padding: EdgeInsets.only(left: 10),child: TextField(
                      cursorColor: Colors.black,
                      style: TextStyle(color: Colors.black),
                      keyboardType:TextInputType.text,
                      onChanged: (value){
                        setState(() {
                          fullname=value;
                        });
                      },
                      decoration: InputDecoration(
                        focusColor: Colors.white,
                        hintText:"Full Name",
                        hintStyle: TextStyle(color: Colors.grey),
                        border:InputBorder.none,
                      ),
                    ),),
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border.all(color:Colors.black,width: 2)
                  ),
                  child:Center(
                    child: Padding(padding: EdgeInsets.only(left: 10),child: TextField(
                      cursorColor: Colors.black,
                      style: TextStyle(color: Colors.black),
                      keyboardType:TextInputType.text,

                      onChanged: (value){
                        setState(() {
                           number=value.toString();
                        });
                      },
                      decoration: InputDecoration(
                        focusColor: Colors.white,
                        hintText:"Mobile No",
                        hintStyle: TextStyle(color: Colors.grey),
                        border:InputBorder.none,

                      ),
                    ),),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 50,
                  width: 200,
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

                      if(value=="VEHICLE OWNER"){
                        setState(() {
                          sel="vo";
                        });
                      }else if(value=="USER"){

                        sel="u";

                      }else if(value=="DRIVER/ OPERATOR"){
                        sel="do";
                      }
                      else{
                        sel="l";
                      }


                    },
                    items:ListItems.map((e){
                      return DropdownMenuItem(value: e
                          ,child: Padding(padding: EdgeInsets.all(10),child: Text(e,style: TextStyle(color: Colors.black),)));
                    }).toList(),

                  ),
                ),


              ],
            ),
          ),
          SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: ()async{

                 // EasyLoading.showToast("Verifying Your Mobile Number.........");
                  //update();
                  Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>ROtpScreen(sel,mobileno.toString(),fullname.toString())));
                },
                child: Container(height: 60,width: MediaQuery.of(context).size.width/1.5,
                  decoration:  BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.black,width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(
                    child: Text("NEXT",style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.w900),),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }

  void update()async{
    try{
      String url = port+"rep";
      var response = await http.post(
          Uri.parse(url),
          headers:{"Content-type":"application/json;charset=UTF-8"},
          body: (
              jsonEncode(  {
                "phone":mobileno
              })

          )
      );
      if(response.statusCode==200){
        if( number.length==13){
         // verifyphone(number);
        }else{
          EasyLoading.showToast("Enter vallid number");
        }
      }else{
        EasyLoading.showSuccess("Already Mobile no is There in our Database");
      }

    }catch(error){
      print(error);
    }

  }

  /*Future<void> verifyphone(String number)async{

    final PhoneVerificationCompleted verified=(PhoneAuthCredential phoneAuthCredential){
      firebaseAuth.signInWithCredential(phoneAuthCredential);
    };
    final PhoneVerificationFailed failed
    = (FirebaseAuthException authException) {
      EasyLoading.showError("Authentication Failed Sorry!!"+authException.message.toString());
      Navigator.of(context).pop();
      print(authException.message);
    };

    final PhoneCodeSent smssent=(String verId,[int? forceResend]){
      this.verificationid=verId;

      Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>ROtpScreen(sel,mobileno.toString(),fullname.toString())));
    } as PhoneCodeSent;
    final PhoneCodeAutoRetrievalTimeout autoRetrievalTimeout=(String varid){
      this.verificationid=varid;
    };


    try{
      firebaseAuth.verifyPhoneNumber(phoneNumber: number, verificationCompleted: verified, verificationFailed: failed, codeSent: smssent, codeAutoRetrievalTimeout:autoRetrievalTimeout,timeout: const Duration(seconds: 5) );
    }catch(e){
      print(e);
    }
  }*/
}
