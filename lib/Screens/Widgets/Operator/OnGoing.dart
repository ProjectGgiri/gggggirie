import 'package:flutter/material.dart';
class OngoRequestCard extends StatefulWidget {
  const OngoRequestCard({Key? key}) : super(key: key);

  @override
  State<OngoRequestCard> createState() => _OngoRequestCardState();
}

class _OngoRequestCardState extends State<OngoRequestCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(20),
      child:Container(
        height: 300,
        width: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 3,
                  spreadRadius: 5
              )
            ]

        ),
        child: Column(
          children: [
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,

              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight:Radius.circular(20) )
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 20,right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Text('Status :',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w900),),
                      Text('IN-PROGRESS',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w900),)],
                  ),Spacer(),Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Text('WID:48264',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w900),),
                      SizedBox(width: 10,),
                      Text('12-07-2022',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w900),)],
                  )],
                ),
              ),

            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,

              decoration: BoxDecoration(
                color: Color(0xffF89500),

              ),
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [Text('Request Operator',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w700),)],
                ),
              ),

            ),
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width,

              decoration: BoxDecoration(
                color: Colors.white,

              ),
              child: Row(
                children: [
                  Container(
                    height: 250,
                    width: 170,
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top: 20),child: Container(
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/1.5.png'),fit: BoxFit.fill
                              )
                          ),
                        ),),
                        SizedBox(height: 10,),
                        Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                          Text("JCB 3C",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
                          Text("200FS",style: TextStyle(color: Colors.black,fontSize: 8,fontWeight: FontWeight.w700),),
                        ],),
                        SizedBox(height: 10,),
                        Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                          Container(height: 20,width: 50,decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              border:  Border.all(color: Colors.black,width: 2)
                          ),child: Center(child:  Text("Bucket",maxLines: 1,style: TextStyle(color: Colors.black,fontSize: 11,fontWeight: FontWeight.w600),),)),
                          SizedBox(width: 5,),
                          Container(height: 20,width: 50,decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              border:  Border.all(color: Colors.black,width: 2)
                          ),child: Center(child:  Text("C-400",maxLines: 1,style: TextStyle(color:Colors.black,fontSize: 11,fontWeight: FontWeight.w600),),)),
                        ],),
                        SizedBox(height: 10,),
                        Container(height: 50,width: 100,decoration: BoxDecoration(

                          color: Color(0xffFFDA92),
                        ),child: Center(child:  Text("??? 1000/ Day",maxLines: 1,style: TextStyle(color: Colors.black,fontSize: 11,fontWeight: FontWeight.w700),),)),
                      ],
                    ),
                  ),
                  Container(
                    height: 250,
                    width: 150,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20,right: 10),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Text("Work Details",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
                          SizedBox(height: 10,),
                          Text("Duration",maxLines: 1,style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500),),
                          SizedBox(height: 10,),
                          Container(height: 20,width: 50,decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Color(0xff2A7E6A).withOpacity(0.3),
                          ),child: Center(child:  Text("3 Days",maxLines: 1,style: TextStyle(color: Color(0xff2A7E6A),fontSize: 11,fontWeight: FontWeight.w600),),)),
                          SizedBox(height: 10,),
                          Text('Shift',maxLines: 1,style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500),),
                          SizedBox(height: 10,),
                          Container(height: 20,width: 60,decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Color(0xff2A7E6A).withOpacity(0.3),
                          ),child: Center(child: Text('Morning',maxLines: 1,style: TextStyle(color: Color(0xff2A7E6A),fontSize: 12,fontWeight: FontWeight.w800),))),
                          SizedBox(height: 10,),
                          Text("Work District",maxLines: 1,style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w800),),
                          SizedBox(height: 10,),
                          Container(height: 20,width: 60,decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Color(0xff2A7E6A).withOpacity(0.3),
                          ),child: Center(child: Text("Medchal",maxLines: 1,style: TextStyle(color: Color(0xff2A7E6A),fontSize: 11,fontWeight: FontWeight.w800),))),
                          SizedBox(height: 10,),
                        ],
                      ),
                    ),
                  ),

                ],
              ),

            ),
          ],
        ),
      ),);
  }
}
