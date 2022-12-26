import 'package:flutter/material.dart';
import 'package:ggiri/Screens/Auth/LOGIN/otpscreen.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
             Padding(padding:EdgeInsets.only(left: 80,),child: Container(
               height: 200,
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
            SizedBox(height: 30,),
            Column(
              children: [
                Text("Log in as",style: TextStyle(color: Colors.black,fontSize: 36,fontWeight: FontWeight.w400),),
                SizedBox(height: 30,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>OtpScreen()));
                  },
                  child: Container(height: 60,width: 300,
                    decoration:  BoxDecoration(

                      border: Border.all(color: Colors.black,width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Center(
                      child: Text("ADMIN",style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w900),),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>OtpScreen()));
                  },
                  child: Container(height: 60,width: 300,
                    decoration:  BoxDecoration(

                      border: Border.all(color: Colors.black,width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Center(
                      child: Text("Vehicle Owner",style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w900),),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>OtpScreen()));
                  },
                  child: Container(height: 60,width: 300,
                    decoration:  BoxDecoration(

                      border: Border.all(color: Colors.black,width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Center(
                      child: Text("Users",style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w900),),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>OtpScreen()));
                  },
                  child: Container(height: 60,width: 300,
                    decoration:  BoxDecoration(

                      border: Border.all(color: Colors.black,width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Center(
                      child: Text("Driver/ Operator",style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w900),),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>OtpScreen()));
                  },
                  child: Container(height: 60,width: 300,
                    decoration:  BoxDecoration(

                      border: Border.all(color: Colors.black,width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Center(
                      child: Text("Labours",style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w900),),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
