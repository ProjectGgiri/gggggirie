import 'package:flutter/material.dart';
import 'package:ggiri/Screens/Dashboard/Owner/SubCat.dart';
import 'package:ggiri/Screens/Dashboard/Owner/SubSubCat.dart';
import 'package:ggiri/Screens/Dashboard/Owner/WORK/SubSubWorkCat.dart';
class SubWorkCard extends StatefulWidget {

  String filename,title;


  SubWorkCard( this.filename, this.title);

  @override
  State<SubWorkCard> createState() => _SubWorkCardState();
}

class _SubWorkCardState extends State<SubWorkCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>SubSubWorkCat(widget.title)));
      },
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          color: Color(0xffF3F3F3),
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 40,),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.filename),fit: BoxFit.fill
                    )
                ),
              ),
              SizedBox(height: 10,),
              Text(widget.title,maxLines: 2,style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w600),),
            ],
          ),
        ),
      ),
    );
  }
}
