import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homeauto/services/rmq_service.dart';
import 'package:homeauto/ui/shared/ui_helper.dart';
import 'package:homeauto/viewmodels/floor3_view_model.dart';
import 'package:stacked/stacked.dart';

import '../shared/ui_helper.dart';

class Floor3View extends StatefulWidget {
  bool status;

  Floor3View({this.status});
  @override
  _Floor3ViewState createState() => _Floor3ViewState();
}

class _Floor3ViewState extends State<Floor3View> {
  RMQService rmqService = new RMQService();
  ValueChanged<bool> onChanged;
  bool floor3_1 = false;
  bool floor3_2 = false;
  bool floor3_3 = false;
  String status_lamp_floor3_1="OFF";
  String status_lamp_floor3_2 = "OFF";
  String status_lamp_floor3_3 = "OFF";
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
      floor3_1 = false;
      floor3_2 = false;
      floor3_3 = false;
      if(widget.status){
        values = "00011111";
        floor3_1 = widget.status;
        floor3_2 =widget.status;
        floor3_3 =widget.status;
      }
    });

  }
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<Floor3ViewModel>.reactive(
      viewModelBuilder: ()=> Floor3ViewModel(),
      onModelReady: (model)=> model.initState(),
      builder: (context,model,child)=>Scaffold(
        backgroundColor: Color(0xffF1F4F6),
        appBar: AppBar(
          title: Text("Lantai 3"),
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
                                "$status_lamp_floor3_1",
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
                                    color: floor3_1 ? Color(0xff0079E2) : Color(0xFFFFFFFF),
                                  ),
                                  child: AnimatedAlign(
                                    duration: const Duration(milliseconds: 300),
                                    alignment:
                                    floor3_1 ? Alignment.centerRight : Alignment.centerLeft,
                                    curve: Curves.decelerate,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: floor3_1 ? Color(0xFFFFFFFF):Color(0xff0079E2),
                                          borderRadius: BorderRadius.circular(100.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    print("dsds");
                                    floor3_1 = !floor3_1;
                                    floor3_1 ? status_lamp_floor3_1 = "ON":status_lamp_floor3_1 = "OFF";
                                    if(floor3_1){
                                      model.replaceCharAt( 0, "0");
                                      model.lampu1(floor3_1);
                                    }else{
                                      model.replaceCharAt( 0,"1");
                                      model.lampu1(floor3_1);
                                    }
                                    // model.lampu1(floor3_1);
                                    // onChanged(floor3_1);
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
                                "$status_lamp_floor3_2",
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
                                    color: floor3_2 ? Color(0xff0079E2) : Color(0xFFFFFFFF),
                                  ),
                                  child: AnimatedAlign(
                                    duration: const Duration(milliseconds: 300),
                                    alignment:
                                    floor3_2 ? Alignment.centerRight : Alignment.centerLeft,
                                    curve: Curves.decelerate,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: floor3_2 ? Color(0xFFFFFFFF):Color(0xff0079E2),
                                          borderRadius: BorderRadius.circular(100.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    print("dsds");
                                    floor3_2 = !floor3_2;
                                    floor3_2 ? status_lamp_floor3_2 = "ON":status_lamp_floor3_2 = "OFF";
                                    if(floor3_2){
                                      model.replaceCharAt( 1,"0");
                                      model.lampu2(floor3_2);
                                    }else{
                                      model.replaceCharAt( 1,"1");
                                      model.lampu2(floor3_2);
                                    }
                                    // model.lampu2(floor3_2);
                                    // onChanged(floor);
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
                                "$status_lamp_floor3_3",
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
                                    color: floor3_3 ? Color(0xff0079E2) : Color(0xFFFFFFFF),
                                  ),
                                  child: AnimatedAlign(
                                    duration: const Duration(milliseconds: 300),
                                    alignment:
                                    floor3_3 ? Alignment.centerRight : Alignment.centerLeft,
                                    curve: Curves.decelerate,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: floor3_3 ? Color(0xFFFFFFFF):Color(0xff0079E2),
                                          borderRadius: BorderRadius.circular(100.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    print("dsds");
                                    floor3_3 = !floor3_3;
                                    floor3_3 ? status_lamp_floor3_3 = "ON":status_lamp_floor3_3 = "OFF";
                                    if(floor3_3){
                                      model.replaceCharAt( 2, "0");
                                      model.lampu3(floor3_3);
                                    }else{
                                      model.replaceCharAt( 2, "1");
                                      model.lampu3(floor3_3);
                                    }
                                    // model.lampu2(floor3_3);
                                    // onChanged(floor);
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
