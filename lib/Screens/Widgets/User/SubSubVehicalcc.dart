import 'package:flutter/material.dart';
import 'package:ggiri/Screens/Dashboard/Owner/SubCat.dart';
import 'package:ggiri/Screens/Dashboard/Owner/SubSubCat.dart';
class SubVehicalCardd extends StatefulWidget {

  String filename,title,staus;


  SubVehicalCardd( this.filename, this.title,this.staus);

  @override
  State<SubVehicalCardd> createState() => _SubVehicalCarddState();
}

class _SubVehicalCarddState extends State<SubVehicalCardd> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>AddSubSubVehical(widget.title,widget.staus)));
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
