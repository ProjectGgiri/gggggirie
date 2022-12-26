import 'package:flutter/material.dart';
import 'package:ggiri/Screens/Dashboard/Laboutr/LabourHome.dart';
import 'package:ggiri/Screens/Dashboard/Laboutr/LabourProfile.dart';
import 'package:ggiri/Screens/Dashboard/Operator/Operatorhome.dart';
import 'package:ggiri/Screens/Dashboard/Operator/OwnerProfile.dart';
import 'package:ggiri/Screens/Dashboard/Owner/Dashboard/FeedbackScreen.dart';
import 'package:ggiri/Screens/Dashboard/Owner/Dashboard/MyRequestScreen.dart';
import 'package:ggiri/Screens/Dashboard/User/UserHome.dart';
import 'package:ggiri/Screens/Dashboard/User/UserProfile.dart';
class UserDashboard extends StatefulWidget {
  String status;


  UserDashboard(this.status);

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  int pageindex=0;
  List<Widget> rscreen=[MyRequestScreen(),UserProfile() ,UserHome("user"),FeedbackScreen()];
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
                botnab(Icons.add_box_outlined,0,"My Request",4),
                botnab(Icons.person_outline,1,"Profile",4),
                botnab(Icons.home,2,"Home",4),
                botnab(Icons.feedback,3,"Feedback",4),

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
