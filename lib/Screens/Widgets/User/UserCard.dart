import 'package:flutter/material.dart';
import 'package:ggiri/Screens/Dashboard/Owner/Agriculture/AddSubAgriVehical.dart';
import 'package:ggiri/Screens/Dashboard/Owner/Cabs/AddSubCabVehical.dart';
import 'package:ggiri/Screens/Dashboard/Owner/Dashboard/MyVehical.dart';
import 'package:ggiri/Screens/Dashboard/Owner/SubCat.dart';
import 'package:ggiri/Screens/Dashboard/Owner/WORK/WorkSubCat.dart';
class UserCard extends StatefulWidget {
  Color colo;
  String filename,title;
  int sel;
  String status;


  UserCard(this.colo, this.filename, this.title,this.sel,this.status);

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(widget.sel==0){
          Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>AddSubVehical(widget.status)));
        }else if(widget.sel==1){
          Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>AddSubAgriVehical()));
        }else if(widget.sel==2){
          Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>AddSubCabVehical()));
        }else{
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
