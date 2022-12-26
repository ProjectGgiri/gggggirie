import 'package:flutter/material.dart';
import 'package:ggiri/Screens/Dashboard/Owner/Agriculture/AddSubAgriVehical.dart';
import 'package:ggiri/Screens/Dashboard/Owner/Cabs/AddSubCabVehical.dart';
import 'package:ggiri/Screens/Dashboard/Owner/SubCat.dart';
import 'package:ggiri/Screens/Dashboard/Owner/SubSubCat.dart';
import 'package:ggiri/Screens/Labour/SubSubLabourwork.dart';
class SelLabourCard extends StatefulWidget {
  Color colo;
  String filename,title;
  int position;
  String status;


  SelLabourCard(this.colo, this.filename, this.title,this.position,this.status);

  @override
  State<SelLabourCard> createState() => _SelLabourCardState();
}

class _SelLabourCardState extends State<SelLabourCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(widget.position==0){
          Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>SubSubLabour(widget.title,"","a")));
        }else if(widget.position==1){
          Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>SubSubLabour(widget.title,"","a")));
        }else{
          Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>SubSubLabour(widget.title,"","a")));
        }
      },
      child: Stack(children: [
        Container(
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
        Positioned(right: 30,top:10,child:Icon(Icons.highlight_remove_outlined,color: Colors.red,))
      ]
        ,
      ),
    );
  }
}
