import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homeauto/services/rmq_service.dart';
import 'package:homeauto/ui/shared/ui_helper.dart';
import 'package:homeauto/ui/widgets/card_view.dart';
import 'package:homeauto/viewmodels/lantai3_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:homeauto/ui/views/floor3_view.dart';

class Lantai3 extends StatefulWidget {
  @override
  _Lantai3State createState() => _Lantai3State();
}

class _Lantai3State extends State<Lantai3> {
  RMQService rmqService = new RMQService();
  ValueChanged<bool> onChanged;
  bool lantai3 = false;
  String status_lantai3 = "OFF";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      lantai3 = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<Lantai3ViewModel>.reactive(
      viewModelBuilder: ()=> Lantai3ViewModel(),
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
                        image: AssetImage("lib/assets/Lantai3.png"),
                        fit: BoxFit.fill
                    ),
                  ),
                ),
                verticalSpaceMedium,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
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
                                    builder: (context) => Floor3View(status: lantai3,)));
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
                                "Floor 3",
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                                softWrap: false,
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15.0),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "$status_lantai3",
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
                                    color: lantai3 ? Color(0xff0079E2) : Color(0xFFFFFFFF),
                                  ),
                                  child: AnimatedAlign(
                                    duration: const Duration(milliseconds: 300),
                                    alignment:
                                    lantai3 ? Alignment.centerRight : Alignment.centerLeft,
                                    curve: Curves.decelerate,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: lantai3 ? Color(0xFFFFFFFF):Color(0xff0079E2),
                                          borderRadius: BorderRadius.circular(100.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    print("dsds");
                                    lantai3 = !lantai3;
                                    model.lampulantai3(lantai3);
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
