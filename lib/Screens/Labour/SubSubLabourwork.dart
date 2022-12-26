import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ggiri/Screens/Dashboard/Laboutr/LabourDashboard.dart';
import 'package:ggiri/Screens/Labour/MyWorkScreen.dart';
import 'package:ggiri/Screens/Model/worklist.dart';
import 'package:ggiri/Screens/Port/port.dart';
import 'package:ggiri/Screens/Widgets/SubVehicalCard.dart';
import 'package:ggiri/Screens/Widgets/VehicalCard.dart';
import 'package:ggiri/Screens/Widgets/ViewVCard.dart';
import 'package:http/http.dart' as http;
import 'package:ggiri/Screens/Widgets/Work/ViewWork.dart';
class SubSubLabour extends StatefulWidget {
  String title;
  String type;
  String status;


  SubSubLabour(this.title,this.type,this.status);

  @override
  State<SubSubLabour> createState() => _SubSubLabourState();
}

class _SubSubLabourState extends State<SubSubLabour> {
  List ListItems=["Male","Female"];
  List BListItems=["O+","A+",'B+','C+'];
  String selected='Male';
  String bselected='O+';
  var data={};
  List d=[];
  var da={};
  List de=[];
  List< WorkList> wo=[];
  bool mer=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdat();
    getdata();

   
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff3146BA),
          elevation: 0,
          actions: [
            Icon(Icons.person,color: Colors.white,size: 50,)
          ],
          leading:   Padding(
            padding: EdgeInsets.only(left: 10,bottom: 5,top: 5),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(color: Color(0xffF89500),borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Center(child: Text("G",style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.w600),),),
            ),
          ),
        ),
        body: Column(
          children: [

            Padding(padding: EdgeInsets.all(20),child:Container(height: 60,width: MediaQuery.of(context).size.width,decoration:BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color(0xffEFEEFF),
            ),child:
            Center(child: Text(widget.title,style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),),)
              ,),
            SizedBox(height: 20,),
            Padding(padding: EdgeInsets.all(20),child: Center(
              child: Text("Select Work From",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w600),),
            )),
            SizedBox(height: 10,),
            mer==true? Expanded(
               child: AlignedGridView.count(
               crossAxisCount: 2,
               mainAxisSpacing: 4,
               crossAxisSpacing: 4,
                itemCount:d.length,
                itemBuilder: (context, index) {
                 return  GestureDetector(onTap: (){

                 },child: ViewWrklCard(wo[index].img,wo[index].name,wo[index].price,wo[index].selected,wo[index].wid,widget.status,wo[index].type)) ;
          },
               ),
             ):Container(child: Center(
              child: Text("Loading.............."),
            ),),


            /*FutureBuilder(future: getdat(),
              builder: (context, snapshot) {
                if(d!.isEmpty){
                  return Center(child:Lottie.network("https://assets1.lottiefiles.com/packages/lf20_mxuufmel.json") ,);
                }
                if(d!.isNotEmpty)
                {
                  return ListView.builder(itemCount: d!.length,itemBuilder:(context,index){

                    return MyNewsCard(d![index]);
                  });
                }
                else{
                  return Center(child:Lottie.network("https://assets7.lottiefiles.com/packages/lf20_p8bfn5to.json") ,) ;
                } snapshot.data == null ? Center(
                  child: Text("Loading data.."),) : Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 6 / 7,
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 10),
                        itemCount: 10,
                        itemBuilder: (BuildContext ctx, index) {

                          return  ViewWrklCard("https://s3-alpha-sig.figma.com/img/4dfa/edb4/a096ac751f3bc781b46525e7bf9c611c?Expires=1667174400&Signature=dxahXdTlP2uZBFKhGTQGzywqszUrM4PwOl1-gt2dOnacBWM~z~W~PiiAO0xjd0qzqBp0KI2~TgWa9NukUg7vFgx9oPYqKO1suKO56Qn3EVBh3nObZ7HH2DckYIJomK0uEaF4om4Hnm3rJsPjo2FfvFNYWj4TtT9eKFr4PLV5hQgvDEZ5mCw7LkZr6LPBhBFja8rfvmvi6TAs32M01COqMHwZKaZSiQYOd45THJa-3CC0UFSCLXeuFJs9gJCSkk~9ZRU0bA55MBLEysR45nY7x6601cfVP2cU0lkthIyU85KaCOXGtNyPj4jmuTPvze-1DARdXlfsKVk0pUFhLRpgBA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA","Electrical",  "1500/Hr");
                        }),
                  ),
                );

              },),*/
          ],
        ),
      ),
    );
  }
  Future<void>getdat()async{
    try{
      String url = port+"workfilter";
      var response = await http.post(
          Uri.parse(url),
          headers:{"Content-type":"application/json;charset=UTF-8"},
          body: (
              jsonEncode(  {
               "type":"A"
              })
          )
      );
          setState(() {
            data=json.decode(response.body);
            d=data["detail"];
          });
    }catch(error){
      EasyLoading.showToast(error.toString());
    }
  }
  Future<void> getdata()async{
    try{
      String url = port+"getworklist";
      var response = await http.post(
          Uri.parse(url),
          headers:{"Content-type":"application/json;charset=UTF-8"},
          body: (
              jsonEncode(  {
                "lid":"123456"
              })
          )

      );
      setState(() {
        da=json.decode(response.body);
        de=data["detail"];
        merge(de,d);
      });



    }catch(error){
      EasyLoading.showToast(error.toString());
    }

  }

  void merge(List de, List d) {
    for (int i = 0; i < de.length; i++) {

      for(int j=0;j<d.length;j++){
       if(de[i]["wid"]==d[j]["wid"]){

        wo.add(WorkList(d[j]["name"],d[j]["wid"] ,d[j]["type"], d[j]["price"], d[j]["img"],true));
       }else{
         wo.add(WorkList(d[i]["name"],d[i]["wid"] ,d[i]["type"], d[i]["price"], d[i]["img"],false));
       }
      }
      setState(() {
        mer = true;
      });
       EasyLoading.showToast("woooooooooooooolist is"+wo.toString());

    }
  }
}
