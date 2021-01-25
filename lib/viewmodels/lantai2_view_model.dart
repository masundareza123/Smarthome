import 'dart:async';

import 'package:homeauto/services/rmq_service.dart';
import 'package:homeauto/viewmodels/base_model.dart';
import 'package:intl/intl.dart';

class Lantai2ViewModel extends BaseModel{
  RMQService rmqService = new RMQService();
  bool front = false;
  bool kitchen = false;
  void initState(){
    front = false;
    kitchen = false;
    lampuDepan(false);
    lampuDapur(false);

  }


  void lampuDepan(bool status){
    if(status){
      rmqService.publish("9e4dd9b9-7b0e-4520-a0d5-43a32faff48a#00000000");
    }else{
      rmqService.publish("9e4dd9b9-7b0e-4520-a0d5-43a32faff48a#11111111");
    }
    front = status;
  }

  void lampuDapur(bool status){
    if(status){
      rmqService.publish("88e4c006-7ea0-4fd5-9bd3-23e7e7f33a4b#00000000");
    }else{
      rmqService.publish("88e4c006-7ea0-4fd5-9bd3-23e7e7f33a4b#11111111");
    }
    kitchen = status;
  }
}
