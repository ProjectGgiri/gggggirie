import 'package:flutter/material.dart';
import 'package:ggiri/Screens/Dashboard/Owner/Dashboard/Bookinginfo.dart';
import 'package:ggiri/Screens/Dashboard/Owner/SelectVehical.dart';
class RemoveVCard extends StatefulWidget {
  String img,com,model,price,capacity,type,name;

  RemoveVCard(
      this.img, this.com, this.model, this.price, this.capacity, this.type,this.name);

  @override
  State<RemoveVCard> createState() => _RemoveVCardState();
}

class _RemoveVCardState extends State<RemoveVCard> {
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
                Positioned(right: 30,top:10,child:Icon(Icons.highlight_remove_outlined,color: Colors.red,))
              ],
            ),
            SizedBox(height: 10,),
            Text("Company : "+widget.com,maxLines: 1,style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w800),),
            SizedBox(height: 10,),
            Text("Model :  "+widget.model,maxLines: 1,style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w800),),
            SizedBox(height: 10,),
            Text("Type: "+widget.type,maxLines: 1,style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w800),),
            SizedBox(height: 10,),
            Text("Capacity :  "+widget.capacity,maxLines: 1,style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w800),),
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
                Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>Bookinginfo(widget.img, widget.com, widget.model, widget.price, widget.capacity, widget.type,widget.name)));
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
