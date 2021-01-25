import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homeauto/ui/shared/ui_helper.dart';

class CardView extends StatelessWidget{
  CardView({this.status});
  String status;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                "$status",
                maxLines: 1,
                overflow: TextOverflow.fade,
                softWrap: false,
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15.0),
              ),
            ),

            ButtonTheme.bar(
              child: ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: const Text('Edit', style: TextStyle(color: Colors.white)),
                    onPressed: () {},
                  ),
                  FlatButton(
                    child: const Text('Delete', style: TextStyle(color: Colors.white)),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}