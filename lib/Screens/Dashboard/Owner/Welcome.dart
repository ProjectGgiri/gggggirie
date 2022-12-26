import 'package:flutter/material.dart';
import 'package:ggiri/Screens/Dashboard/Owner/AddVehical.dart';
class OwnWelcome extends StatefulWidget {
  String staus;


  OwnWelcome(this.staus);

  @override
  State<OwnWelcome> createState() => _OwnWelcomeState();
}

class _OwnWelcomeState extends State<OwnWelcome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
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
                      Text("Profile info",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w600),)
                    ],
                  ),
                ),
              ),),
            SizedBox(height: 10,),
            Padding(padding: EdgeInsets.all(20),
            child: Column(children: [
              Text("Do you own a commercial vehicle or Taxi ?",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w600),),
              SizedBox(height: 30,),
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/bull.png"),fit: BoxFit.fill
                    )
                ),
              ),
              SizedBox(height: 40,),

              Padding(
                padding: EdgeInsets.only(left: 50,right: 50),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>AddVehical(widget.staus)));
                  },
                  child: Container(height: 60,width: 200,
                    decoration:  BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.black,width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Center(
                      child: Text("NEXT",style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.w900),),
                    ),
                  ),
                ),
              ),
            ],),)
          ],
        ),
      ),
    );
  }
}
