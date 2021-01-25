import 'dart:async';

import 'package:homeauto/viewmodels/base_model.dart';
import 'package:intl/intl.dart';

class HomeViewModel extends BaseModel{
  DateTime now;
  String formattedDate;
  String timeString;

  void initState(){
    now = DateTime.now();
    formattedDate = DateFormat('hh:mm').format(now);
    timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }
  String _formatDateTime(DateTime dateTime) {
    return DateFormat('hh:mm:ss').format(dateTime);
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);

    timeString = formattedDateTime;

  }
}