import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homeauto/services/rmq_service.dart';
import 'package:homeauto/ui/shared/ui_helper.dart';
import 'package:homeauto/viewmodels/front_view_model.dart';
import 'package:stacked/stacked.dart';

import '../shared/ui_helper.dart';

class FrontView extends StatefulWidget {
  bool status;

  FrontView({this.status});
  @override
  _FrontViewState createState() => _FrontViewState();
}

class _FrontViewState extends State<FrontView> {
  RMQService rmqService = new RMQService();
  ValueChanged<bool> onChanged;
  bool front = false;
  bool front2 = false;
  bool front3 = false;
  String status_lamp_front="OFF";
  String status_lamp_front2 = "OFF";
  String status_lamp_front3 = "OFF";
  String values = "11111111";

  void replaceCharAt(String oldString, int index,String newChar){
    values =oldString.substring(0, index) + newChar + oldString.substring(index + 1);
    print(values);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      front = false;
      front2 = false;
      front3 = false;
      if(widget.status){
        values = "00011111";
        front = widget.status;
        front2 =widget.status;
        front3 =widget.status;
      }
    });

  }
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FrontViewModel>.reactive(
      viewModelBuilder: ()=> FrontViewModel(),
      onModelReady: (model)=> model.initState(),
      builder: (context,model,child)=>Scaffold(
        backgroundColor: Color(0xffF1F4F6),
        appBar: AppBar(
          title: Text("Lantai 2 Front Lamp"),
        ),
        body: SingleChildScrollView(
          child:Center (
            child: Column(
              children: <Widget>[
                verticalSpaceSmall,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(child: Container(
                      width: 200,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.white,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: <Widget>[
                            verticalSpaceMedium,
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child:Icon(FontAwesomeIcons.lightbulb,color: Colors.blue,),
                            ),
                            verticalSpaceMedium,
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Lampu 1",
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                                softWrap: false,
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15.0),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "$status_lamp_front",
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                                softWrap: false,
                                style: TextStyle(color: Colors.grey, fontSize: 10.0),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 7,bottom: 15,top: 10),
                              child:  InkWell(
                                splashColor: Colors.white,
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.decelerate,

                                  width: 50,
                                  decoration: BoxDecoration(

                                    borderRadius: BorderRadius.circular(50.0),
                                    border: Border.all(color: Color(0xff0079E2)),
                                    color: front ? Color(0xff0079E2) : Color(0xFFFFFFFF),
                                  ),
                                  child: AnimatedAlign(
                                    duration: const Duration(milliseconds: 300),
                                    alignment:
                                    front ? Alignment.centerRight : Alignment.centerLeft,
                                    curve: Curves.decelerate,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: front ? Color(0xFFFFFFFF):Color(0xff0079E2),
                                          borderRadius: BorderRadius.circular(100.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    print("dsds");
                                    front = !front;
                                    front ? status_lamp_front = "ON":status_lamp_front = "OFF";
                                    if(front){
                                      model.replaceCharAt( 0, "0");
                                      model.lampu1(front);
                                    }else{
                                      model.replaceCharAt( 0,"1");
                                      model.lampu1(front);
                                    }
                                    // model.lampu1(front);
                                    // onChanged(front);
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    ),
                    Expanded(child:Container(
                      width: 200,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.white,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: <Widget>[
                            verticalSpaceMedium,
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child:Icon(FontAwesomeIcons.lightbulb,color: Colors.blue,),
                            ),
                            verticalSpaceMedium,
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Lampu 2",
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                                softWrap: false,
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15.0),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "$status_lamp_front2",
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                                softWrap: false,
                                style: TextStyle(color: Colors.grey, fontSize: 10.0),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 7,bottom: 15,top: 10),
                              child: InkWell(
                                splashColor: Colors.white,
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.decelerate,

                                  width: 50,
                                  decoration: BoxDecoration(

                                    borderRadius: BorderRadius.circular(50.0),
                                    border: Border.all(color: Color(0xff0079E2)),
                                    color: front2 ? Color(0xff0079E2) : Color(0xFFFFFFFF),
                                  ),
                                  child: AnimatedAlign(
                                    duration: const Duration(milliseconds: 300),
                                    alignment:
                                    front2 ? Alignment.centerRight : Alignment.centerLeft,
                                    curve: Curves.decelerate,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: front2 ? Color(0xFFFFFFFF):Color(0xff0079E2),
                                          borderRadius: BorderRadius.circular(100.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    print("dsds");
                                    front2 = !front2;
                                    front2 ? status_lamp_front2 = "ON":status_lamp_front2 = "OFF";
                                    if(front2){
                                      model.replaceCharAt( 1,"0");
                                      model.lampu2(front2);
                                    }else{
                                      model.replaceCharAt( 1,"1");
                                      model.lampu2(front2);
                                    }
                                    // model.lampu2(front2);
                                    // onChanged(front);
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),),
                    Expanded(child:Container(
                      width: 200,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.white,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: <Widget>[
                            verticalSpaceMedium,
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child:Icon(FontAwesomeIcons.lightbulb,color: Colors.blue,),
                            ),
                            verticalSpaceMedium,
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Lampu 3",
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                                softWrap: false,
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15.0),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "$status_lamp_front3",
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                                softWrap: false,
                                style: TextStyle(color: Colors.grey, fontSize: 10.0),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 7,bottom: 15,top: 10),
                              child: InkWell(
                                splashColor: Colors.white,
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.decelerate,

                                  width: 50,
                                  decoration: BoxDecoration(

                                    borderRadius: BorderRadius.circular(50.0),
                                    border: Border.all(color: Color(0xff0079E2)),
                                    color: front3 ? Color(0xff0079E2) : Color(0xFFFFFFFF),
                                  ),
                                  child: AnimatedAlign(
                                    duration: const Duration(milliseconds: 300),
                                    alignment:
                                    front3 ? Alignment.centerRight : Alignment.centerLeft,
                                    curve: Curves.decelerate,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: front3 ? Color(0xFFFFFFFF):Color(0xff0079E2),
                                          borderRadius: BorderRadius.circular(100.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    print("dsds");
                                    front3 = !front3;
                                    front3 ? status_lamp_front3 = "ON":status_lamp_front3 = "OFF";
                                    if(front3){
                                      model.replaceCharAt( 2, "0");
                                      model.lampu3(front3);
                                    }else{
                                      model.replaceCharAt( 2, "1");
                                      model.lampu3(front3);
                                    }
                                    // model.lampu2(front3);
                                    // onChanged(front);
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
