import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homeauto/ui/views/lantai1_view.dart';
import 'package:homeauto/ui/views/lantai2_view.dart';
import 'package:homeauto/ui/views/lantai3_view.dart';
import 'package:homeauto/ui/widgets/button_widget.dart';
import 'package:homeauto/ui/shared/ui_helper.dart';


class HistoryView extends StatefulWidget {
  @override
  _HistoryViewState createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  List<Item> _data = generateItems(10);

  Widget _buildListPanel(){
    return ExpansionPanelList(
      expansionCallback:(int index, bool isExpanded){
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children:_data.map<ExpansionPanel>((Item item){
        return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded){
              return ListTile(
                title: Text(item.headerValue),
              );
            },
            body: ListTile(
              title: Text(item.expandedValue),
              subtitle: Text("History Lamp"),
              trailing: Icon(Icons.delete),
              onTap: (){
                setState(() {
                  _data.removeWhere((currentItem) => item == currentItem);
                });
              },
            ),
          isExpanded: item.isExpanded
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
      ),
      body: SingleChildScrollView(
          child: Container(
            child: _buildListPanel(),
          )
      ),
    );
  }
}

class Item {
  String expandedValue;
  String headerValue;
  bool isExpanded;

  Item({this.expandedValue, this.headerValue, this.isExpanded = false});
}

List<Item> generateItems(int numberOfItem){
  return List.generate(numberOfItem, (index){
    return Item(
      headerValue: 'History $index',
      expandedValue: 'History Lamp $index'
    );
  });
}
