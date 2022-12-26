import 'package:flutter/material.dart';
import 'package:ggiri/Screens/Auth/Register/WelcomeScreen.dart';
class ROtpScreen extends StatefulWidget {
  String status;
  String mobileno,name;
  ROtpScreen(this.status,this.mobileno,this.name);
  @override
  State<ROtpScreen> createState() => _ROtpScreenState();
}

class _ROtpScreenState extends State<ROtpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            Column(
              children: [
               Padding(
                 padding: EdgeInsets.all(30),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Text("Register ",style: TextStyle(color: Colors.black,fontSize: 36,fontWeight: FontWeight.w400),),
                   ],
                 ),
               ),

                SizedBox(height: 30,),
               Column(
                 children: [
                   Text("ENTER OTP",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w600),),
                   SizedBox(height: 10,),
                   otpbox(),
                   SizedBox(height: 10,),
                   Text("Resend Otp",style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w600),),
                   SizedBox(height: 5,),
                   Container(height: 4,width: 100,child: Divider(thickness: 3,color: Colors.grey,)),
                   SizedBox(height: 60,),
                   GestureDetector(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>WelcomeScreen(widget.status)));
                     },
                     child: Container(height: 60,width: MediaQuery.of(context).size.width/1.5,
                       decoration:  BoxDecoration(
                         color: Colors.black,
                         border: Border.all(color: Colors.black,width: 2),
                         borderRadius: BorderRadius.all(Radius.circular(10)),
                       ),
                       child: Center(
                         child: Text("SUBMIT",style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.w900),),
                       ),
                     ),
                   )
                 ],
               )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget otpbox() {
    return Padding(padding: EdgeInsets.all(20),child:Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 35,
          width: 35,
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

                });
              },
              decoration: InputDecoration(
                focusColor: Colors.white,
                border:InputBorder.none,
              ),
            ),),
          ),
        ),
        SizedBox(width: 15,),
        Container(
          height: 35,
          width: 35,
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

                });
              },
              decoration: InputDecoration(
                focusColor: Colors.white,
                border:InputBorder.none,
              ),
            ),),
          ),
        ),
        SizedBox(width: 15,),
        Container(
          height: 35,
          width: 35,
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

                });
              },
              decoration: InputDecoration(
                focusColor: Colors.white,
                border:InputBorder.none,
              ),
            ),),
          ),
        ),
        SizedBox(width: 15),
        Container(
          height: 35,
          width: 35,
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

                });
              },
              decoration: InputDecoration(
                focusColor: Colors.white,
                border:InputBorder.none,
              ),
            ),),
          ),
        ),
      ],
    ) ,);
  }
}
