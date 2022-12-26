import 'package:flutter/material.dart';
import 'package:ggiri/Screens/Dashboard/Operator/OperatorDashboard.dart';
import 'package:ggiri/Screens/Dashboard/Owner/Dashboard/Dashboard.dart';
import 'package:ggiri/Screens/Dashboard/User/UserDashboard.dart';
class CongraScreen extends StatefulWidget {
  String name;
  String status;


  CongraScreen(this.name,this.status);

  @override
  State<CongraScreen> createState() => _CongraScreenState();
}

class _CongraScreenState extends State<CongraScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:Scaffold(
      body:  ListView(
        children: [
          Container(height: 200,width: MediaQuery.of(context).size.width,
            child:Container(
              height: 200,
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
                    Text("Add Vehicle",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w600),),
                  ],
                ),
              ),
            ),),
          Padding(padding: EdgeInsets.all(0),child:Container(height: 60,width: MediaQuery.of(context).size.width,decoration:BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color(0xff8FF8A300),
          ),child:
          Center(child: Text(widget.name,style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),),)
            ,),
          SizedBox(height: 50,),
          CircleAvatar(
            radius: 50,
            backgroundColor: Color(0xff30D35D),
            child: Center(child: Icon(Icons.done,color:Colors.white,size: 50,),),
          ),
          SizedBox(height: 20,),
          Padding(padding: EdgeInsets.only(left: 50,right: 50,bottom: 80,top: 20),child: Text("Your Vehicle is added to the list and sent for verification.",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),)),

          Padding(
            padding: EdgeInsets.only(left: 50,right: 50,bottom: 50),
            child: GestureDetector(
              onTap: (){
                if(widget.status=="do"){
                  Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>OperatorDashboard("do")));
                }else if(
                widget.status=="u"
                ){
                  Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>UserDashboard("u")));
                }else {
                  Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>Dashboard("do"))); 
                }
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
