import 'package:flutter/material.dart';
import 'package:ggiri/Screens/Dashboard/Owner/CongratScreen.dart';
import 'package:ggiri/Screens/Dashboard/Owner/SelectVehical.dart';
import 'package:ggiri/Screens/Dashboard/User/UserBookVehicles.dart';
class BackhoeCard extends StatefulWidget {
  String img,com,model,price,type,tyre,feet,status;

  BackhoeCard(this.img, this.com, this.model, this.price, this.type,this.tyre,this.feet,this.status);

  @override
  State<BackhoeCard> createState() => _BackhoeCardState();
}

class _BackhoeCardState extends State<BackhoeCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Container(
        height: 400,
        width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                      color:Color(0xffF3F3F3) ,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                ),
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.img),fit: BoxFit.fill
                      )
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Text("Company : "+widget.com,maxLines: 1,style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w800),),
            SizedBox(height: 10,),
            Text("Model :  "+widget.model,maxLines: 1,style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w800),),
            SizedBox(height: 10,),
            Text("Type: "+widget.type,maxLines: 1,style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w800),),
            SizedBox(height: 10,),
            Text("Tyre :  "+widget.tyre,maxLines: 1,style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w800),),
            SizedBox(height: 10,),
            Text("Feet :  "+widget.feet,maxLines: 1,style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w800),),
            SizedBox(height: 10,),
            Row(
              children: [
                Text("Price: ",maxLines: 1,style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w800),),
                Text(widget.price,maxLines: 1,style: TextStyle(color: Colors.red,fontSize: 12,fontWeight: FontWeight.w800),),
              ],
            ),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                if(widget.status=="do"){
                  Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>CongraScreen("Go to Dashboard","do")));
                }else{
                 Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>UserBookScreen(widget.img, widget.com, widget.model, widget.price,"nfhheu", widget.type,"jskgcgtr")));
                }
                //img,com,model,price,capacity,type,name;
              },
              child: Container(
                height: 50,
                width: 150,
                color: Colors.black,
                child: Center(
                  child:  Text("Select",maxLines: 1,style: TextStyle(color: Colors.white,fontSize: 11,fontWeight: FontWeight.w500),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
