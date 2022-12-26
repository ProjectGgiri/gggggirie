import 'package:flutter/material.dart';
import 'package:ggiri/Screens/Widgets/Cabs/ViewCabCard.dart';
import 'package:ggiri/Screens/Widgets/SubVehicalCard.dart';
import 'package:ggiri/Screens/Widgets/VehicalCard.dart';
import 'package:ggiri/Screens/Widgets/ViewVCard.dart';
class AddSubSubCab extends StatefulWidget {
  String title;


  AddSubSubCab(this.title);

  @override
  State<AddSubSubCab> createState() => _AddSubSubCabState();
}

class _AddSubSubCabState extends State<AddSubSubCab> {
  List ListItems=["Type"];
  List BListItems=["O+","A+",'B+','C+'];
  String selected='Type';
  String bselected='O+';
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
                      Text("Add Vehicle",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w600),)
                    ],
                  ),
                ),
              ),),
            Padding(padding: EdgeInsets.all(0),child:Container(height: 60,width: MediaQuery.of(context).size.width,decoration:BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color(0xff8FF8A300),
            ),child:
            Center(child: Text(widget.title,style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),),)
              ,),
            SizedBox(height: 20,),
            Padding(padding: EdgeInsets.only(left: 20,right: 20),child:   Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border.all(color:Colors.black,width: 2)
                  ),
                  child: DropdownButton(
                    hint: Text("Select",style: TextStyle(color: Colors.black),),
                    value:  selected,
                    dropdownColor: Colors.white,
                    style: TextStyle(color: Colors.black),
                    onChanged: (value){
                      setState(() {
                        selected=value.toString();
                      });
                    },
                    items:ListItems.map((e){
                      return DropdownMenuItem(value: e
                          ,child: Padding(padding: EdgeInsets.all(10),child: Text(e,style: TextStyle(color: Colors.black),)));
                    }).toList(),

                  ),
                ),


              ],
            ),),
            SizedBox(height: 10,),
            ViewCabCard("https://s3-alpha-sig.figma.com/img/4430/a8b9/8951d85d92da9a4b8bdadc7c161aa89b?Expires=1667174400&Signature=PnglcGJtS0FJZEkbY9NylnUXqyHt4kyq7u-EKl6RcnLn9U~AcCjezOsLI-owt-jHiNAj8HQuTQSiVFync~isH4DUsGebkqs9t1bg4Qxrwb3ps58I4N~rzpY9dG7VXstZcUxaAXkWAhiPzARygudme59JbyXhZIHK3N9vHnjAifDSL7IGNtq2IxOP4j8A8F-k07CwJeEKAHa0p776zS0U67GL98zPgEANm2nynQvqahARmEJfdGYU~Y5dSZHg~wmTyRtRsqo~AAaIffib79Fe~He854wQo~xm-4wZ5Elled5T~N-tj0O~5TFEWWAtGkBjtg4JU9RDNmTETLdcj-U0bg__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",  "1500/Hr", "mini", "Hundai"),


          ],
        ),
      ),
    );
  }
}
