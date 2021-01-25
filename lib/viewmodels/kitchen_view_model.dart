import 'dart:async';

import 'package:homeauto/services/rmq_service.dart';
import 'package:homeauto/viewmodels/base_model.dart';
import 'package:intl/intl.dart';

class KitchenViewModel extends BaseModel{
  RMQService rmqService = new RMQService();
  bool kitchen = false;
  bool kitchen2 = false;
  bool kitchen3 = false;
  bool kitchen4 = false;
  String values = "11111111";

  void replaceCharAt( int index,String newChar){
    values =values.substring(0, index) + newChar + values.substring(index + 1);
    print(values);
  }

  void initState(){
    // Kitchen = false;
    // Kitchen2 = false;
    // lampu1(false);
    // lampu2(false);

  }


  void lampu1(bool status){
    if(status){
      rmqService.publish("88e4c006-7ea0-4fd5-9bd3-23e7e7f33a4b#$values");
    }else{
      rmqService.publish("88e4c006-7ea0-4fd5-9bd3-23e7e7f33a4b#$values");
    }
    kitchen = status;
  }

  void lampu2(bool status){
    if(status){
      rmqService.publish("88e4c006-7ea0-4fd5-9bd3-23e7e7f33a4b#$values");
    }else{
      rmqService.publish("88e4c006-7ea0-4fd5-9bd3-23e7e7f33a4b#$values");
    }
    kitchen2 = status;
  }

  void lampu3(bool status){
    if(status){
      rmqService.publish("88e4c006-7ea0-4fd5-9bd3-23e7e7f33a4b#$values");
    }else{
      rmqService.publish("88e4c006-7ea0-4fd5-9bd3-23e7e7f33a4b#$values");
    }
    kitchen3 = status;
  }

  void lampu4(bool status){
    if(status){
      if(kitchen == true && kitchen2 == true && kitchen3 == true){
        rmqService.publish("88e4c006-7ea0-4fd5-9bd3-23e7e7f33a4b#00000000");
      }
      rmqService.publish("88e4c006-7ea0-4fd5-9bd3-23e7e7f33a4b#$values");
    }else{
      rmqService.publish("88e4c006-7ea0-4fd5-9bd3-23e7e7f33a4b#$values");
    }
    kitchen4 = status;
  }

}
