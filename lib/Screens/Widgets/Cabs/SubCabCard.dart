import 'package:flutter/material.dart';
import 'package:ggiri/Screens/Dashboard/Owner/Cabs/AddSubSubCab.dart';
import 'package:ggiri/Screens/Dashboard/Owner/SubCat.dart';
import 'package:ggiri/Screens/Dashboard/Owner/SubSubCat.dart';
import 'package:ggiri/Screens/Dashboard/Owner/WORK/SubSubWorkCat.dart';
import 'package:ggiri/Screens/DriversandOperator/CarsCabScreen.dart';
class SubCabCard extends StatefulWidget {

  String filename,title,tag;



  SubCabCard ( this.filename, this.title,this.tag);

  @override
  State<SubCabCard > createState() => _SubCabCardState();
}

class _SubCabCardState extends State<SubCabCard > {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(widget.tag=="c"){
          Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>AddCarCab(widget.title,"getbycf","getbycff","C","f")));
        }else if(widget.tag=="b"){
          Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>AddSecCarCab(widget.title,"getbycf","B","f")));
        }else if(widget.tag=="a"){
          Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>AddSecCarCab(widget.title,"getbycf","A","f")));
        }

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
              SizedBox(height: 20,),
              Container(
                height: 80,
                width: 140,
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
