import 'package:flutter/material.dart';
import 'package:ggiri/Screens/Dashboard/Owner/Agriculture/AddSubAgriVehical.dart';
import 'package:ggiri/Screens/Dashboard/Owner/Cabs/AddSubCabVehical.dart';
import 'package:ggiri/Screens/Dashboard/Owner/SubCat.dart';
import 'package:ggiri/Screens/Dashboard/Owner/SubSubCat.dart';
import 'package:ggiri/Screens/Labour/SubSubLabourwork.dart';
class LabourCard extends StatefulWidget {
  Color colo;
  String filename,title;
  int position;
  String status;


  LabourCard(this.colo, this.filename, this.title,this.position,this.status);

  @override
  State<LabourCard> createState() => _LabourCardState();
}

class _LabourCardState extends State<LabourCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(widget.position==0){
          Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>SubSubLabour(widget.title,"C",widget.status)));
        }else if(widget.position==1){
          Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>SubSubLabour(widget.title,"A",widget.status)));
        }else{
          Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>SubSubLabour(widget.title,"O",widget.status)));
        }
      },
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
            color: widget.colo,
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
