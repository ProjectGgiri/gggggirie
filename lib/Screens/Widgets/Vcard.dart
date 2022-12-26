import 'package:flutter/material.dart';
import 'package:ggiri/Screens/Dashboard/Owner/Dashboard/MyVehical.dart';
import 'package:ggiri/Screens/Dashboard/Owner/SubCat.dart';
import 'package:ggiri/Screens/Dashboard/Owner/WORK/WorkSubCat.dart';
class HomeVehicalCard extends StatefulWidget {
  Color colo;
  String filename,title;
  int sel;
  String status;


  HomeVehicalCard(this.colo, this.filename, this.title,this.sel,this.status);

  @override
  State<HomeVehicalCard> createState() => _HomeVehicalCardState();
}

class _HomeVehicalCardState extends State<HomeVehicalCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
         if(widget.sel==0){
           Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>MyVehical(widget.status)));
         }else if(widget.sel==1){
           Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>WorkSubVehical()));
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
