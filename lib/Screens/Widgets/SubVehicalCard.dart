import 'package:flutter/material.dart';
import 'package:ggiri/Screens/Dashboard/Owner/SubCat.dart';
import 'package:ggiri/Screens/Dashboard/Owner/SubSubCat.dart';
import 'package:ggiri/Screens/Dashboard/User/BACKHOEScreen.dart';
import 'package:ggiri/Screens/Dashboard/User/UserBookVehicles.dart';
import 'package:ggiri/Screens/Widgets/AddVehicles/COMPACTORScreen.dart';
import 'package:ggiri/Screens/Widgets/AddVehicles/DozenScrren.dart';
import 'package:ggiri/Screens/Widgets/AddVehicles/LoadeerScreen.dart';
import 'package:ggiri/Screens/Widgets/AddVehicles/LoaderScreen.dart';
class SubVehicalCard extends StatefulWidget {

  String filename,title,staus,code;



  SubVehicalCard( this.filename, this.title,this.staus,this.code);

  @override
  State<SubVehicalCard> createState() => _SubVehicalCardState();
}

class _SubVehicalCardState extends State<SubVehicalCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(widget.code=="e"){
          Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>BackHoeScreen(widget.title,widget.staus,"getexa","getexf")));
        }
       if(widget.code=="b"){
         Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>BackHoeScreen(widget.title,widget.staus,"getback","getbackf")));
       }else if(widget.code=="l"){
         Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>LoaderScreen(widget.title,widget.staus,"getloader","getloaderf")));
       }
       else if(widget.code=="c"){
         Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>CompactorScreen(widget.title,widget.staus,"getcompactor","getcompf")));
       }else if(widget.code=="d"){
         Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>DozersScreen(widget.title,widget.staus,"getdroz","getdrozf")));
       }else if(widget.code=="cr"){
         Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>LoaderScreen(widget.title,widget.staus,"getloader","getloaderf")));
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
