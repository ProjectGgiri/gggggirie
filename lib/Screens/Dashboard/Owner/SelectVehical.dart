import 'package:flutter/material.dart';
import 'package:ggiri/Screens/Dashboard/Owner/CongratScreen.dart';
import 'package:ggiri/Screens/Widgets/SubVehicalCard.dart';
import 'package:ggiri/Screens/Widgets/VehicalCard.dart';
import 'package:ggiri/Screens/Widgets/ViewVCard.dart';
class SelectVehical extends StatefulWidget {
  String img,com,model,price,capacity,type,name;


  SelectVehical(
      this.img, this.com, this.model, this.price, this.capacity, this.type,this.name);


  @override
  State<SelectVehical > createState() => _SelectVehicalState();
}

class _SelectVehicalState extends State<SelectVehical > {
  List ListItems=["2007","2010","2011","2012","2013","2014",'2015'];
  List BListItems=["O+","A+",'B+','C+'];
  String selected='2007';
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
            SizedBox(height: 10,),
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
                                  image: AssetImage(widget.img),fit: BoxFit.fill
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
                        SizedBox(height: 50,),
                        Text("Company : "+widget.com,maxLines: 1,style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w800),),
                        SizedBox(height: 10,),
                        Text("Model :  "+widget.model,maxLines: 1,style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w800),),
                        SizedBox(height: 10,),
                        Text("Type: "+widget.type,maxLines: 1,style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w800),),
                        SizedBox(height: 10,),
                        Text("Capacity :  "+widget.capacity,maxLines: 1,style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w800),),
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
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Registration No.",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w700),),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width/2.5,
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
                              hintText:"AP04EH8764",
                              hintStyle: TextStyle(color: Colors.grey),
                              border:InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(height: 50,width: 100,
                        decoration:  BoxDecoration(
                          color: Color(0xff3A2AFA),
                        ),
                        child: Center(
                          child: Text("Check",style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.w900),),
                        ),
                      ),
                      Spacer(),
                      CircleAvatar(
                        backgroundColor: Color(0xff30D35D),
                        child: Center(child: Icon(Icons.done,color:Colors.white,),),
                      )

                    ],
                  )

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Upload RC",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w700),),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Column(children: [
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(color: Color(0xffE7E7E7),borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: Center(
                            child: Icon(Icons.camera_alt_outlined),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text("Front",style: TextStyle(color: Colors.black,fontSize: 13,),),
                      ],),
                      Spacer(),
                      Column(children: [
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(color: Color(0xffE7E7E7),borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: Center(
                            child: Icon(Icons.camera_alt_outlined),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text("Back",style: TextStyle(color: Colors.black,fontSize: 13),),
                      ],),


                    ],
                  ),
                  SizedBox(height: 10,),


                ],
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width/2.5,
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
                    hintText:"AP04EH8764",
                    hintStyle: TextStyle(color: Colors.grey),
                    border:InputBorder.none,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 50,right: 50,bottom: 50),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>CongraScreen(widget.name,"u")));
                },
                child: Container(height: 60,width: 60,
                  decoration:  BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.black,width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(
                    child: Text("SUBMIT",style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.w900),),
                  ),
                ),
              ),
            )


          ],
        ),
      ),
    );
  }
}
