import 'dart:async';

import 'package:homeauto/services/rmq_service.dart';
import 'package:homeauto/viewmodels/base_model.dart';
import 'package:homeauto/ui/views/front_view.dart';
import 'package:intl/intl.dart';

class FrontViewModel extends BaseModel{
  RMQService rmqService = new RMQService();
  bool front = false;
  bool front2 = false;
  bool front3 = false;
  String values = "11111111";

  void replaceCharAt( int index,String newChar){
    values =values.substring(0, index) + newChar + values.substring(index + 1);
    print(values);
  }

  void initState(){
    // front = false;
    // front2 = false;
    // lampu1(false);
    // lampu2(false);

  }


  void lampu1(bool status){
    if(status){
      rmqService.publish("9e4dd9b9-7b0e-4520-a0d5-43a32faff48a#$values");
      print(values);
    }else{
      rmqService.publish("9e4dd9b9-7b0e-4520-a0d5-43a32faff48a#$values");
      print(values);
    }
    front = status;
  }

  void lampu2(bool status){
    if(status){
      rmqService.publish("9e4dd9b9-7b0e-4520-a0d5-43a32faff48a#$values");
      print(values);
    }else{
      rmqService.publish("9e4dd9b9-7b0e-4520-a0d5-43a32faff48a#$values");
      print(values);
    }
    front2 = status;
  }

  void lampu3(bool status){
    if(status){
      rmqService.publish("9e4dd9b9-7b0e-4520-a0d5-43a32faff48a#$values");
      print(values);
    }else{
      rmqService.publish("9e4dd9b9-7b0e-4520-a0d5-43a32faff48a#$values");
      print(values);
    }
    front3 = status;
  }

}
