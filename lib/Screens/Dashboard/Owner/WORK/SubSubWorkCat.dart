import 'package:flutter/material.dart';
import 'package:ggiri/Screens/Widgets/SubVehicalCard.dart';
import 'package:ggiri/Screens/Widgets/VehicalCard.dart';
import 'package:ggiri/Screens/Widgets/ViewVCard.dart';
import 'package:ggiri/Screens/Widgets/Work/ViewWork.dart';
class SubSubWorkCat extends StatefulWidget {
  String title;


  SubSubWorkCat(this.title);

  @override
  State<SubSubWorkCat> createState() => _SubSubWorkCatState();
}

class _SubSubWorkCatState extends State<SubSubWorkCat> {
  List ListItems=["Male","Female"];
  List BListItems=["O+","A+",'B+','C+'];
  String selected='Male';
  String bselected='O+';
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
        body: ListView(
          children: [

            Padding(padding: EdgeInsets.all(20),child:Container(height: 60,width: MediaQuery.of(context).size.width,decoration:BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color(0xffEFEEFF),
            ),child:
            Center(child: Text(widget.title,style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),),)
              ,),
            SizedBox(height: 20,),
            Padding(padding: EdgeInsets.all(20),child: Center(
              child: Text("Select Work From",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w600),),
            )),
            SizedBox(height: 10,),
           // ViewWrklCard("https://s3-alpha-sig.figma.com/img/2ffa/3cd2/6b9c2f13aecc310b8b207910f031f120?Expires=1667174400&Signature=AL79lA32dQmtrvjRzFtxwKeQLkrmibbmBMUnhzUXAmYpVfz7Y3KKadbrHpEd-cgx8cjrIgAUVQAX3zCvYPLRxxWJ9STKHR1qe9UVXmeY32Nc1gOvTbvrL3gzEMjHBizR01wDVfIY7eYXxqCPVA9AGKtxqUzPVdWMvcJDkbPGZ5EkZLFkQnwpXKHmz7Hn0KMukdX1-HTT9g~KEVE9rucP4OZh2h4IYj1O1J-cEsI9RbyHg5opiO5npjZHwVIdVz3y4uMrQPl0dXNAHg1m1Yjo6bUgVPBTeiI43oLXz8JZEBJRb63suGiRt90Fmgua~WHYPL7cQZwONOc-CHwSUPIB1w__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA", "Cement & Brick",  "1500/Hr",true),
            //ViewWrklCard("https://s3-alpha-sig.figma.com/img/4dfa/edb4/a096ac751f3bc781b46525e7bf9c611c?Expires=1667174400&Signature=dxahXdTlP2uZBFKhGTQGzywqszUrM4PwOl1-gt2dOnacBWM~z~W~PiiAO0xjd0qzqBp0KI2~TgWa9NukUg7vFgx9oPYqKO1suKO56Qn3EVBh3nObZ7HH2DckYIJomK0uEaF4om4Hnm3rJsPjo2FfvFNYWj4TtT9eKFr4PLV5hQgvDEZ5mCw7LkZr6LPBhBFja8rfvmvi6TAs32M01COqMHwZKaZSiQYOd45THJa-3CC0UFSCLXeuFJs9gJCSkk~9ZRU0bA55MBLEysR45nY7x6601cfVP2cU0lkthIyU85KaCOXGtNyPj4jmuTPvze-1DARdXlfsKVk0pUFhLRpgBA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA","Electrical",  "1500/Hr",true)

          ],
        ),
      ),
    );
  }
}
