import 'package:flutter/material.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        children: [
          Container(height: 350,width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xffB9C8FF),
                  child: Padding(padding: EdgeInsets.only(left: 10,top: 10),child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      Text("My Profile",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w600),),
                      SizedBox(height: 5,),

                    ],
                  ),),
                ),
                Positioned(right: 20,top: 200,child:Row(
                  children: [
                    Icon(Icons.edit,color: Colors.blue,),
                    Text("Edit",style: TextStyle(color: Colors.blue,fontSize: 13,fontWeight: FontWeight.w600),)
                  ],
                )),
                Positioned(left: 100,right: 100,top: 180,child:Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Color(0xffE7E7E7),
                      border: Border.all(color: Colors.white,width: 5),
                      borderRadius: BorderRadius.all(Radius.circular(100),),
                    image: DecorationImage(
                      image: NetworkImage("https://images.pexels.com/photos/1484794/pexels-photo-1484794.jpeg?auto=compress&cs=tinysrgb&w=600"),
                      fit: BoxFit.cover
                    )
                  ),

                )),

              ],
            ),),
          SizedBox(height: 10,),
          Column(
            children: [
              Text("Jhon Doe",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),),
              SizedBox(height: 5,),
              Text("UID:100064",style: TextStyle(color: Color(0xff3146BA),fontSize: 13,fontWeight: FontWeight.w600),),
              SizedBox(height: 5,),
              Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                Icon(Icons.star,color: Color(0xffF89500),),
                Icon(Icons.star,color: Color(0xffF89500)),
                Icon(Icons.star,color: Color(0xffF89500)),
                Icon(Icons.star,color: Color(0xffF89500)),
                Icon(Icons.star,color: Color(0xffF89500),)
              ],),
              SizedBox(height: 5,),
              Text("5",style: TextStyle(color: Color(0xffF89500),fontSize: 13,fontWeight: FontWeight.w600),),
              SizedBox(height: 10,),
              Container(
                height: 60,
                width: 200,
                decoration: BoxDecoration(color: Color(0xffEED682),
                borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Center(child: Text("Driver/Operator",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),) ,),
              )




            ],
          ),

          SizedBox(height: 20,),

         Padding(padding: EdgeInsets.all(30),child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text("Male",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),
                     SizedBox(height: 5,),
                     Text("Male",style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500),),
                   ],
                 ),
                 Spacer(),
                 Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text("D.O.B",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),
                     SizedBox(height: 5,),
                     Text("22-Apr-2022",style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500),),
                   ],
                 )
               ],
             ),
             SizedBox(height: 10,),
             Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text("Blood Group",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),
                     SizedBox(height: 5,),
                     Text("O Positive",style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500),),
                   ],
                 ),
                 Spacer(),
                 Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text("Contact",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),
                     SizedBox(height: 5,),
                     Text("9847356121",style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500),),
                   ],
                 )
               ],
             ),
             SizedBox(height: 20,),
             Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text("Address",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),
                 SizedBox(height: 5,),
                 Text("Street-1, Road-2, place, city, state 600081",style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500),),
               ],
             ),
           ],
         )
             ),
          SizedBox(height: 10,),
        
          SizedBox(height: 10,),

        ],
      ),
    );
  }
}
