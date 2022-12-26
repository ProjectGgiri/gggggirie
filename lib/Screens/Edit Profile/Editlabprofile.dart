import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ggiri/Screens/Dashboard/Owner/Welcome.dart';
import 'package:ggiri/Screens/Labour/AddLabour.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../Port/port.dart';
class EditLabour extends StatefulWidget {
  Map data;


  EditLabour(this.data);

  @override
  State<EditLabour > createState() => _EditLabourState();
}

class _EditLabourState extends State<EditLabour> {

  String selected='Male';
  String bselected='O+';
  List ListItems=["Male","Female"];
  List BListItems=["O+","A+",'B+','C+'];
  String durl="";
  late String selgen="Male",selblood="O+",selstate="TELANGANA",seldis="ADILABAD";
  List States=["TELANGANA"];
  List District=["ADILABAD","BHADRADRI KOTHAGUDEM","HANUMAKONDA","Jagitial","JANGOAN","JAYASHANKAR BHUPALAPALLY","JOGULAMBA GADWAL","KAMAREDDY","KARIMNAGAR","KHAMMAM","KUMURAM BHEEM ASIFABAD","MAHABUBABAD","MAHABUBNAGAR","Mancherial","MEDAK","MEDCHAL MALKAJGIRI","Mulugu","NAGARKURNOOL","NALGONDA","Narayanpet","Nirmal","NIZAMABAD","Peddapalli","RAJANNA SIRCILLA","RANGAREDDI","SANGAREDDY","SIDDIPET","SURYAPET","VIKARABAD","WANAPARTHY","WARANGAL","YADADRI BHUVANAGIRI"];
  File? file=null;
  File? back=null, front=null;
  String? backdurl=null, frontdurl=null;
  bool bloodsel=false;

  late String dob,gender,bloodgroup,address,state,district,pincode;
  TextEditingController dobb=new TextEditingController();
  TextEditingController addre=new TextEditingController();
  TextEditingController pin=new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      pin.text=widget.data["detail"]["Pincode"];
      addre.text=widget.data["detail"]["address"];
      durl=widget.data["detail"]["purl"];

      if(widget.data["detail"]["gender"]){
        selgen="Male";
      }else{
        selgen="Female";
      }
      pincode=widget.data["detail"]["Pincode"];
      address=widget.data["detail"]["address"];
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:Scaffold(
      body: ListView(
        children: [
          Container(height: 350,width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xffB9C8FF),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 60,
                              width: 60,

                              decoration: BoxDecoration(color: Color(0xffF89500),borderRadius: BorderRadius.all(Radius.circular(30))),
                              child: Center(child: Text("G",style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.w600),),),
                            ),
                            SizedBox(width: 5,),
                            Text("giri",style: TextStyle(color: Color(0xff3A2AFA),fontSize: 40,fontWeight: FontWeight.w600),)
                          ],
                        ),
                        SizedBox(height: 50,),
                        Text("Edit Profile ",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w600),)
                      ],
                    ),
                  ),
                ),
                Positioned(left: 100,right: 100,top: 180,child:GestureDetector(
                  onTap: (){
                    getimage(ImageSource.gallery, 0);
                  },
                  child: file!=null?Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white,width: 3),
                        image: DecorationImage(
                            image: FileImage(file!),fit: BoxFit.fill
                        )
                    ),
                  ):GestureDetector(
                    onTap: (){
                      getimage(ImageSource.gallery, 0);
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white,width: 3),
                          image: DecorationImage(
                              image: NetworkImage(durl),fit: BoxFit.fill
                          )
                      ),
                    ),
                  ) ,
                ))
              ],
            ),),
          SizedBox(height: 10,),
          Padding(padding: EdgeInsets.only(left: 20,right: 20),child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 10,),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("D.0.B",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                      SizedBox(height: 10,),
                      Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(color:Colors.black,width: 2)
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: TextField(
                            cursorColor: Colors.grey,
                            style: TextStyle(color: Colors.black),
                            keyboardType:TextInputType.text,
                            onChanged: (value){
                              setState(() {

                              });
                            },
                            maxLines: 50,
                            decoration: InputDecoration(
                              focusColor: Colors.white,
                              hintText:"10/12/2003",
                              hintStyle: TextStyle(color: Colors.black),
                              border:InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 10,),


                ],
              ),
              SizedBox(height: 10,),
              Row(children: [
                Column(
                  children: [
                    Text("Blood Group",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                    SizedBox(height: 10,),
                    Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(color:Colors.black,width: 2)
                      ),
                      child: DropdownButton(
                        hint: Text("Select",style: TextStyle(color: Colors.black),),
                        value:  bselected,
                        dropdownColor: Colors.blue,
                        style: TextStyle(color: Colors.black),
                        onChanged: (value){
                          setState(() {
                            bselected=value.toString();
                            if(bselected=="Male"){
                              setState(() {
                                bloodsel=true;
                              });
                            }else{
                              setState(() {
                                bloodsel=false;
                              });
                            }
                          });
                        },
                        items:BListItems.map((e){
                          return DropdownMenuItem(value: e
                              ,child: Padding(padding: EdgeInsets.all(10),child: Text(e,style: TextStyle(color: Colors.black),)));
                        }).toList(),

                      ),
                    ),
                  ],
                ),Spacer(), Column(
                  children: [
                    Text("Gender",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                    SizedBox(height: 10,),
                    Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(color:Colors.black,width: 2)
                      ),
                      child: DropdownButton(
                        hint: Text("Select",style: TextStyle(color: Colors.black),),
                        value:  selected,
                        dropdownColor: Colors.blue,
                        style: TextStyle(color: Colors.black),
                        onChanged: (value){
                          setState(() {
                            selected=value.toString();
                          });
                        },
                        items:ListItems.map((e){
                          return DropdownMenuItem(value: e
                              ,child: Padding(padding: EdgeInsets.all(10),child: Text(e,style: TextStyle(color: Colors.black),)));
                        }).toList(),

                      ),
                    ),
                  ],
                ),
              ],),
              SizedBox(height: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Address",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                  SizedBox(height: 10,),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(color:Colors.black,width: 2)
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: TextField(
                        controller: addre,
                        cursorColor: Colors.grey,
                        style: TextStyle(color: Colors.black),
                        keyboardType:TextInputType.text,
                        onChanged: (value){
                          setState(() {
                            address=value.toString();
                          });
                        },
                        maxLines: 50,
                        decoration: InputDecoration(
                          focusColor: Colors.white,
                          hintText:"HO/No Street",
                          hintStyle: TextStyle(color: Colors.black),
                          border:InputBorder.none,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 20,),
              Row(


                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("State",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                      SizedBox(height: 10,),
                      Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(color:Colors.black,width: 2)
                        ),
                        child: DropdownButton(
                          hint: Text("Select",style: TextStyle(color: Colors.black),),
                          value:  selstate,
                          dropdownColor: Colors.blue,
                          style: TextStyle(color: Colors.black),
                          onChanged: (value){
                            setState(() {
                              selstate=value.toString();
                            });
                          },
                          items:States.map((e){
                            return DropdownMenuItem(value: e
                                ,child: Padding(padding: EdgeInsets.all(10),child: Text(e,style: TextStyle(color: Colors.black),)));
                          }).toList(),

                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 10,),
                  Column(

                    children: [
                      Text("District",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                      SizedBox(height: 10,),
                      Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(color:Colors.black,width: 2)
                        ),
                        child: DropdownButton(
                          hint: Text("Select",style: TextStyle(color: Colors.black),),
                          value:  seldis,
                          dropdownColor: Colors.blue,
                          style: TextStyle(color: Colors.black),
                          onChanged: (value){
                            setState(() {
                              seldis=value.toString();
                            });
                          },
                          items:District.map((e){
                            return DropdownMenuItem(value: e
                                ,child: Padding(padding: EdgeInsets.all(10),child: Text(e,style: TextStyle(color: Colors.black),)));
                          }).toList(),

                        ),
                      ),
                    ],
                  ),

                ],
              ),
              SizedBox(height: 20,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Pincode",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                  SizedBox(height: 10,),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(color:Colors.black,width: 2)
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: TextField(
                        controller: pin,
                        cursorColor: Colors.grey,
                        style: TextStyle(color: Colors.black),
                        keyboardType:TextInputType.number,
                        onChanged: (value){
                          setState(() {
                            pincode=value.toString();
                          });
                        },
                        maxLength: 6,

                        decoration: InputDecoration(
                          focusColor: Colors.white,
                          counterText: "",
                          hintText:"102345",
                          hintStyle: TextStyle(color: Colors.black),
                          border:InputBorder.none,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 20,),

            ],
          ),),
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.only(left: 50,right: 50),
            child: GestureDetector(
              onTap: (){
                EasyLoading.showToast(bselected.toString()+selgen.toString()+address.toString()+selstate.toString()+seldis.toString()+pincode.toString());
                if( bselected!=null&&selgen!=null&&address!=null&&selstate!=null&&seldis!=null&&pincode!=null){
                  if(file!=null){
                    EasyLoading.show(status: "Wait ....");
                    up();
                  }else{
                    EasyLoading.show(status: "Wait ....");
                    update();
                  }
                }else{
                  EasyLoading.showError("Please Select Profile Image or some Fields are Empty");
                }
              },
              child: Container(height: 60,width: 200,
                decoration:  BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.black,width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Center(
                  child: Text("UPDATE",style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.w900),),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
        ],
      ),
    ));
  }
  getimage(ImageSource gallery,int i)async {
    PickedFile? imag=await ImagePicker().getImage(source:gallery,imageQuality: 50 ,maxHeight:400 ,maxWidth:400 );
    if(i==0){
      setState(() {
        file =File(imag!.path);
      });
    }
  }
  up()async{
    var responce =await http.MultipartRequest("POST",Uri.parse(port+"upload"));
    responce.files.add(await http.MultipartFile.fromPath("profile",file!.path ));
    responce.headers.addAll({"Content-type":"multipart/form-data"});
    var res=await responce.send();
    if(res.statusCode==200 || res.statusCode==201){
      var responseString = await res.stream.bytesToString();
      final decodedMap = json.decode(responseString);
      setState(() {
        durl=decodedMap['profile_url'];
      });
      update();

    }else{
      EasyLoading.showError("Uploaded error");
    }
  }
  void update()async{
    try{
      String url = port+"editlabour";
      var response = await http.post(
          Uri.parse(url),
          headers:{"Content-type":"application/json;charset=UTF-8"},
          body: (
              jsonEncode(  {
                "lid":"gfddfdshhhjbhjnj",
                "purl": durl,
                "gender":true,
                "bgroup": bselected,
                "address": address,
                "State": selstate,
                "District": seldis,
                "Pincode": pincode
              })

          )
      );
      if(response.statusCode==200){
        EasyLoading.showSuccess("Updated");
        Navigator.of(context).pop();
      }else{
        EasyLoading.showSuccess("Failed to Update");
      }

    }catch(error){
      print(error);
    }

  }

}
