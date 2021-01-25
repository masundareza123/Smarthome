import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:homeauto/services/rmq_service.dart';
import 'package:homeauto/ui/shared/ui_helper.dart';


class Lantai1 extends StatefulWidget {
  @override
  _Lantai1State createState() => _Lantai1State();
}

class _Lantai1State extends State<Lantai1> {
  RMQService rmqService = new RMQService();
  bool isSwitched = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isSwitched = false;
    });
  rmqService.publish("9e4dd9b9-7b0e-4520-a0d5-43a32faff48a#11111111");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home),
        title: Text("Lantai 1"),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(0.0),
                height: 270.0,//MediaQuery.of(context).size.width * .08,
                color: Colors.black12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
