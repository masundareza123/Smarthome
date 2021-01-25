import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final Function onTapFunction;
  get borderRadius => BorderRadius.circular(8.0);

  const ButtonWidget(
      {Key key, @required this.title, @required this.onTapFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 10,
        borderRadius: borderRadius,
        child: InkWell(
          onTap: onTapFunction,
          child: Container(
            padding: EdgeInsets.all(0.0),
            height: 60.0,//MediaQuery.of(context).size.width * .08,
            width: 220.0,//MediaQuery.of(context).size.width * .3,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
            ),
            child: Row(
              children: <Widget>[
                LayoutBuilder(builder: (context, constraints) {
                  print(constraints);
                  return Container(
                    height: constraints.maxHeight,
                    width: constraints.maxHeight,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: borderRadius,
                    ),
                    child: Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                    ),
                  );
                }),
                Expanded(
                  child: Text(
                    '$title',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

