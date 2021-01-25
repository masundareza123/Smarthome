import 'dart:async';

import 'package:homeauto/services/rmq_service.dart';
import 'package:homeauto/viewmodels/base_model.dart';
import 'package:homeauto/ui/views/floor3_view.dart';
import 'package:intl/intl.dart';

class Floor3ViewModel extends BaseModel{
  RMQService rmqService = new RMQService();
  bool floor3_1 = false;
  bool floor3_2 = false;
  bool floor3_3 = false;
  String values = "11111111";

  void replaceCharAt( int index,String newChar){
    values =values.substring(0, index) + newChar + values.substring(index + 1);
    print(values);
  }

  void initState(){
    // floor3 = false;
    // floor32 = false;
    // lampu1(false);
    // lampu2(false);

  }


  void lampu1(bool status){
    if(status){
      rmqService.publish("5bc28389-4502-4f1e-9046-334f3d9823cb#$values");
      print(values);
    }else{
      rmqService.publish("5bc28389-4502-4f1e-9046-334f3d9823cb#$values");
      print(values);
    }
    floor3_1 = status;
  }

  void lampu2(bool status){
    if(status){
      rmqService.publish("5bc28389-4502-4f1e-9046-334f3d9823cb#$values");
      print(values);
    }else{
      rmqService.publish("5bc28389-4502-4f1e-9046-334f3d9823cb#$values");
      print(values);
    }
    floor3_2 = status;
  }

  void lampu3(bool status){
    if(status){
      rmqService.publish("5bc28389-4502-4f1e-9046-334f3d9823cb#$values");
      print(values);
    }else{
      rmqService.publish("5bc28389-4502-4f1e-9046-334f3d9823cb#$values");
      print(values);
    }
    floor3_3 = status;
  }

}
