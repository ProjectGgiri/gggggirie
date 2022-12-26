import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ggiri/Screens/Auth/AuthScreen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool islogin=false;
  String? status=null;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds:3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder:(BuildContext)=>AuthScreen()));
      if(islogin==true){
       // Navigator.pushReplacement(context, MaterialPageRoute(builder:(BuildContext)=>DashBoard(status.toString())));
      }else{
        //Navigator.pushReplacement(context, MaterialPageRoute(builder:(BuildContext)=>Chooselanguage()));
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: 200,
          width: 200,

          decoration: BoxDecoration(
            color: Color(0xffF89500),
            border: Border.all(color: Colors.white,width: 7),
            borderRadius: BorderRadius.all(Radius.circular(100)),

          ),child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Ggiri",style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.w600),),
            SizedBox(height: 5,),
            Text("Connecting People.",style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w600),)
          ],
        ),),
        ),
      ),
    );
  }

}