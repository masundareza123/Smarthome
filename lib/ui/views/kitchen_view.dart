import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homeauto/services/rmq_service.dart';
import 'package:homeauto/ui/shared/ui_helper.dart';
import 'package:homeauto/viewmodels/kitchen_view_model.dart';
import 'package:stacked/stacked.dart';

import '../shared/ui_helper.dart';

class KitchenView extends StatefulWidget {
  bool status;

  KitchenView({this.status});
  @override
  _KitchenViewState createState() => _KitchenViewState();
}

class _KitchenViewState extends State<KitchenView> {
  RMQService rmqService = new RMQService();
  ValueChanged<bool> onChanged;
  bool kitchen = false;
  bool kitchen2 = false;
  bool kitchen3 = false;
  bool kitchen4 = false;
  String status_lamp_kitchen="OFF";
  String status_lamp_kitchen2 = "OFF";
  String status_lamp_kitchen3 = "OFF";
  String status_lamp_kitchen4 = "OFF";
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
      kitchen = false;
      kitchen2 = false;
      kitchen3 = false;
      kitchen4 = false;
      if(widget.status){
        values = "00011111";
        kitchen = widget.status;
        kitchen2 =widget.status;
        kitchen3 =widget.status;
        kitchen4 =widget.status;
      }
    });

  }
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<KitchenViewModel>.reactive(
      viewModelBuilder: ()=> KitchenViewModel(),
      onModelReady: (model)=> model.initState(),
      builder: (context,model,child)=>Scaffold(
        backgroundColor: Color(0xffF1F4F6),
        appBar: AppBar(
          title: Text("Lantai 2 Kitchen Lamp"),
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
                                "$status_lamp_kitchen",
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
                                    color: kitchen ? Color(0xff0079E2) : Color(0xFFFFFFFF),
                                  ),
                                  child: AnimatedAlign(
                                    duration: const Duration(milliseconds: 300),
                                    alignment:
                                    kitchen ? Alignment.centerRight : Alignment.centerLeft,
                                    curve: Curves.decelerate,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: kitchen ? Color(0xFFFFFFFF):Color(0xff0079E2),
                                          borderRadius: BorderRadius.circular(100.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    print("dsds");
                                    kitchen = !kitchen;
                                    kitchen ? status_lamp_kitchen = "ON":status_lamp_kitchen = "OFF";
                                    if(kitchen){
                                      model.replaceCharAt( 0, "0");
                                      model.lampu1(kitchen);
                                    }else{
                                      model.replaceCharAt( 0,"1");
                                      model.lampu1(kitchen);
                                    }
                                    // model.lampu1(kitchen);
                                    // onChanged(kitchen);
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
                                "$status_lamp_kitchen2",
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
                                    color: kitchen2 ? Color(0xff0079E2) : Color(0xFFFFFFFF),
                                  ),
                                  child: AnimatedAlign(
                                    duration: const Duration(milliseconds: 300),
                                    alignment:
                                    kitchen2 ? Alignment.centerRight : Alignment.centerLeft,
                                    curve: Curves.decelerate,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: kitchen2 ? Color(0xFFFFFFFF):Color(0xff0079E2),
                                          borderRadius: BorderRadius.circular(100.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    print("dsds");
                                    kitchen2 = !kitchen2;
                                    kitchen2 ? status_lamp_kitchen2 = "ON":status_lamp_kitchen2 = "OFF";
                                    if(kitchen2){
                                      model.replaceCharAt( 1,"0");
                                      model.lampu2(kitchen2);
                                    }else{
                                      model.replaceCharAt( 1,"1");
                                      model.lampu2(kitchen2);
                                    }
                                    // model.lampu2(kitchen2);
                                    // onChanged(kitchen);
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
                                "$status_lamp_kitchen3",
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
                                    color: kitchen3 ? Color(0xff0079E2) : Color(0xFFFFFFFF),
                                  ),
                                  child: AnimatedAlign(
                                    duration: const Duration(milliseconds: 300),
                                    alignment:
                                    kitchen3 ? Alignment.centerRight : Alignment.centerLeft,
                                    curve: Curves.decelerate,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: kitchen3 ? Color(0xFFFFFFFF):Color(0xff0079E2),
                                          borderRadius: BorderRadius.circular(100.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    print("dsds");
                                    kitchen3 = !kitchen3;
                                    kitchen3 ? status_lamp_kitchen3 = "ON":status_lamp_kitchen3 = "OFF";
                                    if(kitchen3){
                                      model.replaceCharAt( 2, "0");
                                      model.lampu3(kitchen3);
                                    }else{
                                      model.replaceCharAt( 2, "1");
                                      model.lampu3(kitchen3);
                                    }
                                    // model.lampu2(kitchen3);
                                    // onChanged(kitchen);
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
                                "Lampu 4",
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                                softWrap: false,
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15.0),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "$status_lamp_kitchen4",
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
                                    color: kitchen4 ? Color(0xff0079E2) : Color(0xFFFFFFFF),
                                  ),
                                  child: AnimatedAlign(
                                    duration: const Duration(milliseconds: 300),
                                    alignment:
                                    kitchen4 ? Alignment.centerRight : Alignment.centerLeft,
                                    curve: Curves.decelerate,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: kitchen4 ? Color(0xFFFFFFFF):Color(0xff0079E2),
                                          borderRadius: BorderRadius.circular(100.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    print("dsds");
                                    kitchen4 = !kitchen4;
                                    kitchen4 ? status_lamp_kitchen4 = "ON":status_lamp_kitchen4 = "OFF";
                                    if(kitchen4){
                                      model.replaceCharAt( 3, "0");
                                      model.lampu4(kitchen4);
                                    }else{
                                      model.replaceCharAt( 3, "1");
                                      model.lampu4(kitchen4);
                                    }
                                    // model.lampu2(kitchen4);
                                    // onChanged(kitchen);
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
