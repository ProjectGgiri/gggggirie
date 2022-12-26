import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ggiri/Screens/Widgets/RequestWidget/CompletedCard.dart';
import 'package:ggiri/Screens/Widgets/RequestWidget/Inprogresscard.dart';
import 'package:ggiri/Screens/Widgets/RequestWidget/RequestCard.dart';
class MyRequestScreen extends StatefulWidget {
  const MyRequestScreen({Key? key}) : super(key: key);

  @override
  State<MyRequestScreen> createState() => _MyRequestScreenState();
}

class _MyRequestScreenState extends State<MyRequestScreen> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
           elevation: 0,
          bottom: TabBar(indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black,

          ),
             labelColor: Colors.white,

              unselectedLabelColor: Colors.black,
              tabs:[
            Tab(child: Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.black,width: 2)
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text("Open"),
              ),
            ),),
                Tab(child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.black,width: 2)
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("On Going"),
                  ),
                ),),
                Tab(child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.black,width: 2)
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Completed"),
                  ),
                ),),
          ]),
        ),
        body:TabBarView(
          children: [
            RequestCard(),
            InProgressCard(),
            CompletedCard()
          ],
        ),
      ),
    );
  }
}
