import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homeauto/services/rmq_service.dart';
import 'package:homeauto/ui/shared/ui_helper.dart';
import 'package:homeauto/ui/views/front_view.dart';
import 'package:homeauto/ui/views/kitchen_view.dart';
import 'package:homeauto/viewmodels/lantai2_view_model.dart';
import 'package:stacked/stacked.dart';

import '../shared/ui_helper.dart';

class Lantai2 extends StatefulWidget {
  @override
  _Lantai2State createState() => _Lantai2State();
}

class _Lantai2State extends State<Lantai2> {
  RMQService rmqService = new RMQService();
  ValueChanged<bool> onChanged;
  bool front = false;
  bool kitchen = false;
  String status_lamp_front="OFF";
  String status_lamp_kitchen = "OFF";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      front = false;
      kitchen = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<Lantai2ViewModel>.reactive(
      viewModelBuilder: ()=> Lantai2ViewModel(),
      onModelReady: (model)=> model.initState(),
      builder: (context,model,child)=>Scaffold(
        backgroundColor: Color(0xffF1F4F6),
        body: SingleChildScrollView(
          child:Center (
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(0.0),
                  height: 270.0,//MediaQuery.of(context).size.width * .08,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    image: DecorationImage(
                        image: AssetImage("lib/assets/Lantai2.png"),
                        fit: BoxFit.fill
                    ),
                  ),
                ),
                verticalSpaceMedium,
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
                        child: InkWell(
                          onTap : (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FrontView(status: front,)));
                          },
                          child: Column(
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
                                  "Front Lamp",
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
                                      model.lampuDepan(front);
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
                    ),
                    Expanded(child:Container(
                      width: 200,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.white,
                        child: InkWell(
                          onTap : (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => KitchenView(status: kitchen,)));
                          },
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
                                "Kitchen Lamp",
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
                              child: InkWell(
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
                                    kitchen ? status_lamp_front = "ON":status_lamp_front = "OFF";
                                    model.lampuDapur(kitchen);
                                    // onChanged(front);
                                  });
                                },
                              ),
                            )
                          ],
                         ),
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
