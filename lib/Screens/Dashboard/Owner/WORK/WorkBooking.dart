import 'package:flutter/material.dart';
import 'package:ggiri/Screens/Dashboard/Owner/Dashboard/DCongratScreen.dart';
import 'package:ggiri/Screens/Widgets/SubVehicalCard.dart';
import 'package:ggiri/Screens/Widgets/VehicalCard.dart';
import 'package:ggiri/Screens/Widgets/ViewVCard.dart';
class WorkBookinginfo extends StatefulWidget {

String img,name, price;

WorkBookinginfo(this.img, this.name,this.price);

@override
  State<WorkBookinginfo > createState() => _WorkBookinginfoState();
}

class _WorkBookinginfoState extends State<WorkBookinginfo> {
  List BListItems=['0',"2","3","4","5","6","7"];
  List days=['0',"2","3","4","5","6","7"];
  List shifts =['Morning',"Evening"];

  String selected='Male';
  String bselected='0';
  String bday='2';
  String bshift='Morning';
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
            Padding(padding: EdgeInsets.all(0),child:Container(height: 60,width: MediaQuery.of(context).size.width,decoration:BoxDecoration(

              color: Color(0xff8FF8A300),
            ),child:
            Center(child:    Text("BOOKING INFO",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),),)
              ,),
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 130,
                          width: 130,
                          decoration: BoxDecoration(
                              color:Color(0xffF3F3F3) ,
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                        ),
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(widget.img),fit: BoxFit.fill
                              )
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 100,),
                        Text("Name : "+widget.name,maxLines: 1,style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w800),),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Text("Price: ",maxLines: 1,style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w800),),
                            Text(widget.price,maxLines: 1,style: TextStyle(color: Colors.red,fontSize: 12,fontWeight: FontWeight.w800),),
                          ],
                        ),
                        SizedBox(height: 10,),
                      ],
                    )

                  ],
                ),

              ),
            ),

            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Work Info",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w800),),
                  SizedBox(height: 10,),
                  Text("Workers Count",style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w700),),
                  SizedBox(height: 10,),
                  Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(color:Colors.black,width: 2)
                    ),
                    child: DropdownButton(
                      hint: Text("Select",style: TextStyle(color: Colors.black),),
                      value:  bselected,
                      dropdownColor: Colors.white,
                      style: TextStyle(color: Colors.black),
                      onChanged: (value){
                        setState(() {
                          bselected=value.toString();
                        });
                      },
                      items:BListItems.map((e){
                        return DropdownMenuItem(value: e
                            ,child: Padding(padding: EdgeInsets.all(10),child: Text(e,style: TextStyle(color: Colors.black),)));
                      }).toList(),

                    ),
                  ),
                  SizedBox(height: 10,),
                 Row(
                   children: [
                     Text("Days",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                     SizedBox(width: 130,),
                     Text("Shift",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                   ],
                 ),
                  Row(
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
                          value:  bday,
                          dropdownColor: Colors.white,
                          style: TextStyle(color: Colors.black),
                          onChanged: (value){
                            setState(() {
                              bday=value.toString();
                            });
                          },
                          items:days.map((e){
                            return DropdownMenuItem(value: e
                                ,child: Padding(padding: EdgeInsets.all(10),child: Text(e,style: TextStyle(color: Colors.black),)));
                          }).toList(),

                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(color:Colors.black,width: 2)
                        ),
                        child: DropdownButton(
                          hint: Text("Select",style: TextStyle(color: Colors.black),),
                          value:  bshift,
                          dropdownColor: Colors.white,
                          style: TextStyle(color: Colors.black),
                          onChanged: (value){
                            setState(() {
                              bselected=value.toString();
                            });
                          },
                          items:shifts.map((e){
                            return DropdownMenuItem(value: e
                                ,child: Padding(padding: EdgeInsets.all(10),child: Text(e,style: TextStyle(color: Colors.black),)));
                          }).toList(),

                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text("Work Details",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                  SizedBox(height: 10,),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(color:Colors.black,width: 2)
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: TextField(
                        cursorColor: Colors.grey,
                        style: TextStyle(color: Colors.black),
                        keyboardType:TextInputType.text,
                        onChanged: (value){
                          setState(() {

                          });
                        },
                        maxLines: 50,
                        decoration: InputDecoration(
                          focusColor: Colors.white,
                          hintText:"Type here about the work",
                          hintStyle: TextStyle(color: Colors.black),
                          border:InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("Work District",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                  SizedBox(height: 10,),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(color:Colors.black,width: 2)
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: TextField(
                        cursorColor: Colors.grey,
                        style: TextStyle(color: Colors.black),
                        keyboardType:TextInputType.text,
                        onChanged: (value){
                          setState(() {

                          });
                        },
                        maxLines: 50,
                        decoration: InputDecoration(
                          focusColor: Colors.white,
                          hintText:"Type Work District",
                          hintStyle: TextStyle(color: Colors.black),
                          border:InputBorder.none,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10,),
                  Text("Work Location",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                  SizedBox(height: 10,),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(color:Colors.black,width: 2)
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: TextField(
                        cursorColor: Colors.grey,
                        style: TextStyle(color: Colors.black),
                        keyboardType:TextInputType.text,
                        onChanged: (value){
                          setState(() {

                          });
                        },
                        maxLines: 50,
                        decoration: InputDecoration(
                          focusColor: Colors.white,
                          hintText:"Address of the work to be performed",
                          hintStyle: TextStyle(color: Colors.black),
                          border:InputBorder.none,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 50,right: 50,bottom: 50),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>DCongraScreen()));
                },
                child: Container(height: 60,width: 200,
                  decoration:  BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.black,width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(
                    child: Text("BOOK NOW",style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.w900),),
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
