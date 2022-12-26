import 'package:flutter/material.dart';
import 'package:ggiri/Screens/Dashboard/Owner/Dashboard/Dashboard.dart';
class DCongraScreen extends StatefulWidget {


  @override
  State<DCongraScreen> createState() => _DCongraScreenState();
}

class _DCongraScreenState extends State<DCongraScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3146BA),
        elevation: 0,
        actions: [
          Icon(Icons.person,color: Colors.white,size: 50,)
        ],
        leading:   Padding(
          padding: EdgeInsets.only(left: 10,bottom: 5,top: 5),
          child: Container(
            height: 50,
            width: 50,

            decoration: BoxDecoration(color: Color(0xffF89500),borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Center(child: Text("G",style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.w600),),),
          ),
        ),
      ),
      body:  ListView(
        children: [

          SizedBox(height: 200,),
          CircleAvatar(
            radius: 50,
            backgroundColor: Color(0xff30D35D),
            child: Center(child: Icon(Icons.done,color:Colors.white,size: 50,),),
          ),
          SizedBox(height: 20,),
          Padding(padding: EdgeInsets.only(left: 50,right: 50,bottom: 80,top: 20),child: Text("Your requested has been succussfully submitted",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),)),

          Padding(
            padding: EdgeInsets.only(left: 50,right: 50,bottom: 50),
            child: GestureDetector(
              onTap: (){

                Navigator.pushReplacement(context, MaterialPageRoute(builder:(BuildContext)=>Dashboard("do")));

              },
              child: Container(height: 60,width: 60,
                decoration:  BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.black,width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Center(
                  child: Text("GO TO HOME",style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.w900),),
                ),
              ),
            ),
          )


        ],
      ),
    ));
  }
}
