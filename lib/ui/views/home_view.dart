import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homeauto/ui/views/lantai1_view.dart';
import 'package:homeauto/ui/views/lantai2_view.dart';
import 'package:homeauto/ui/views/lantai3_view.dart';

import 'package:homeauto/ui/widgets/button_widget.dart';
import 'package:homeauto/ui/shared/ui_helper.dart';
import 'package:homeauto/viewmodels/home_view_model.dart';
import 'package:stacked/stacked.dart';

import 'history_view.dart';
import 'lantai1_view.dart';
import 'lantai2_view.dart';
import 'lantai3_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int page;
  get borderRadius => BorderRadius.circular(8.0);
  @override
  Widget build(BuildContext context) {
    // Lock Orientation Portait Only
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: ()=> HomeViewModel(),
      builder: (context,model,child)=>Scaffold(
        backgroundColor: Color(0xffF1F4F6),
        appBar: AppBar(
          backgroundColor: Color(0xffF1F4F6),
          elevation: 0,
          title: Text("Home Automation",style: TextStyle(color: Color(0xff257AE2)),),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.notifications,color: Color(0xff7B93A8),),
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HistoryView()));
              },
            )
          ],
        ),
        body: SafeArea(
            child: DefaultTabController(
              length: 3,
              initialIndex: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    child: TabBar(

                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.black,
                      tabs: [
                        Tab(text: 'LANTAI 1'),
                        Tab(text: 'LANTAI 2'),
                        Tab(text: 'LANTAI 3'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      //height of TabBarView
                        decoration: BoxDecoration(
                            border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
                        ),
                        child: TabBarView(children: <Widget>[
                          Container(
                            child: Center(
                              child: Text('Display Tab', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Lantai2(),
                          Lantai3()
                        ])
                    ),
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
}
