import 'package:flutter/material.dart';
import 'package:ggiri/Screens/DriversandOperator/profileinfo/profileinfo.dart';
import 'package:ggiri/Screens/Labour/LabourProfileinfo.dart';
import 'package:ggiri/Screens/Ownwer/Profile/Profileinfo.dart';
import 'package:ggiri/Screens/Users/profileinfo.dart';
class WelcomeScreen extends StatefulWidget {
  String status;


  WelcomeScreen(this.status);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/fullc.png"),fit: BoxFit.fill
                  )
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 80,),
                    Text("Registration Successful !"+widget.status.toString(),style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600),),
                    SizedBox(height: 100,),
                    Text("Welcome to",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w600),),
                    SizedBox(height: 10,),
                    Text("Ggiri",style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.w600),),
                    SizedBox(height: 10,),
                    Text("Connecting People.",style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w600),)
                  ],
                ),
              ),
            ),
            SizedBox(height: 150,),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: [
              GestureDetector(onTap: (){
               // Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>Profileinfo()));
              },child: Text("To Profile",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),)),
              SizedBox(width: 10,),
              IconButton(onPressed: (){
                if(widget.status=="vo"){
                  Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>Profileinfo(widget.status)));
                }else if(widget.status=="u"){
                  Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>UserProfileinfoDriver(widget.status)));
                }else if(widget.status.toString()=="do"){
                  Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>ProfileinfoDriver(widget.status)));
                }else{
                  Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=> LabourProfileinfo(widget.status)));
                }

              }, icon:Icon(Icons.arrow_circle_right_outlined,color: Colors.black,size: 30,))
            ],)
          ],
        ),
      ),
    );
  }
}
