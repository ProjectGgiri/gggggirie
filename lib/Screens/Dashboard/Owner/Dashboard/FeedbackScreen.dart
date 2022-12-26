import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ggiri/Screens/Port/port.dart';
import 'package:http/http.dart' as http;
class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  TextEditingController feedback=new TextEditingController();
  late String content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(


        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Feedback",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),
                SizedBox(height: 10,),
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border.all(color:Color(0xffDADADA),width: 2)
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: TextField(
                      cursorColor: Colors.grey,
                      style: TextStyle(color: Colors.black),
                      keyboardType:TextInputType.text,
                      controller: feedback,
                      onChanged: (value){
                        setState(() {
                            content=value.toString();
                        });
                      },
                      maxLines: 50,
                      decoration: InputDecoration(
                        focusColor: Colors.white,
                        hintText:"Type Feedback",
                        hintStyle: TextStyle(color: Colors.black),
                        border:InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,children: [

                  GestureDetector(
                    onTap: (){
                         if(content!=null){
                           EasyLoading.show(status:"Wait..............." );
                           postfeed();
                         }else{
                           EasyLoading.showError("Please Enter some Content in Box..");
                         }
                    },
                    child: Container(
                      height: 60,
                      width: 200,
                      decoration: BoxDecoration(color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Center(child: Text("SUBMIT",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),) ,),
                    ),
                  )
                ],)
              ],
            ),
          ),


        ],
      ),
    );
  }
  Future<void>postfeed()async{
    try{
      String url = port+"addfeed";
      var response = await http.post(
          Uri.parse(url),
          headers:{"Content-type":"application/json;charset=UTF-8"},
          body: (
              jsonEncode(  {
                "uid": "123456",

                "type": "L",

                "content": content
              })
          )

      );
     if(response.statusCode==200){
       feedback.clear();
       EasyLoading.showSuccess("We have taken your valuable feedback");

     }else{
       EasyLoading.showSuccess("Sorry Something went Wrong????");
      }



    }catch(error){
      EasyLoading.showToast(error.toString());
    }

  }
}
