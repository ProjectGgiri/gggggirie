import 'package:flutter/material.dart';
import 'package:ggiri/Screens/Dashboard/Laboutr/LabourHome.dart';
import 'package:ggiri/Screens/Dashboard/Laboutr/LabourProfile.dart';
import 'package:ggiri/Screens/Dashboard/Operator/Operatorhome.dart';
import 'package:ggiri/Screens/Dashboard/Operator/OwnerProfile.dart';
import 'package:ggiri/Screens/Dashboard/Owner/Dashboard/FeedbackScreen.dart';
class LabourDashboard extends StatefulWidget {
  String status;


  LabourDashboard(this.status);

  @override
  State<LabourDashboard> createState() => _LabourDashboardState();
}

class _LabourDashboardState extends State<LabourDashboard> {
  int pageindex=0;
  List<Widget> rscreen=[LabourProfile() ,LabourHome("do"),FeedbackScreen()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
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
        bottomNavigationBar: Stack(
          children: [
            Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/down.png"),fit: BoxFit.fill
                  )
              ),

            ),
            Row(
              children: [

                botnab(Icons.person_outline,0,"Profile",3),
                botnab(Icons.home,1,"Home",3),
                botnab(Icons.feedback,2,"Feedback",3),

              ],
            ),
          ],
        ),
        body:IndexedStack(
          index: pageindex,
          children:rscreen,
        ),
      ),
    );
  }
  Widget botnab(IconData id ,int index,String name,int  size) {
    return InkWell(
      onTap: (){
        setState(() {
          pageindex=index;
        });
      },
      child: AnimatedContainer(
        duration: new Duration(seconds:1),
        height: 70,
        width: MediaQuery.of(context).size.width/size,
        decoration:BoxDecoration(
          color: Colors.black,
        ),
        child: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(id,color: index==pageindex? Colors.white:Colors.grey),
              SizedBox(height: 5,),
              Text(index==pageindex?name:name,style: index==pageindex?TextStyle(color:Colors.white):TextStyle(color:Colors.grey),),
            ],
          ) ,
        ),
      ),
    ) ;
  }
}
