import 'package:flutter/material.dart';
import 'package:ggiri/Screens/Auth/LOGIN/LoginScreen.dart';
import 'package:ggiri/Screens/Auth/Register/Regester.dart';
class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
             Container(
               height: 600,
               width: MediaQuery.of(context).size.width,
               child: Stack(
                 children: [
                   Padding(padding:EdgeInsets.all(20),child: Container(
                     height: 500,
                     width: MediaQuery.of(context).size.width,
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.all(Radius.circular(15)),
                         image: DecorationImage(
                             image: AssetImage("assets/images/a.jpg"),fit: BoxFit.cover
                         )
                     ),
                   ),),
                   Positioned(left: MediaQuery.of(context).size.width/5,top: 400,child:Container(
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
                   )),


                 ],
               ),
             ),
            SizedBox(height:50 ,),
             Padding(
               padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>LoginScreen()));
                    },
                    child: Container(height: 60,width: MediaQuery.of(context).size.width/2.8,
                      decoration:  BoxDecoration(
                        border: Border.all(color: Colors.black,width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(
                        child: Text("LOG IN ",style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w900),),
                      ),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>RegisterScreen()));
                    },
                    child: Container(height: 60,width: MediaQuery.of(context).size.width/2,
                      decoration:  BoxDecoration(
                        color: Colors.black,
                        border: Border.all(color: Colors.black,width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(
                        child: Text("REGISTER ",style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.w900),),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
