import 'package:homeauto/viewmodels/base_model.dart';
import 'package:homeauto/services/rmq_service.dart';

class Lantai3ViewModel extends BaseModel{
  RMQService rmqService = new RMQService();
  bool lantai3 = false;

  void lampulantai3(bool status){
    if(status){
      rmqService.publish("5bc28389-4502-4f1e-9046-334f3d9823cb#00000000");
    }else{
      rmqService.publish("5bc28389-4502-4f1e-9046-334f3d9823cb#11111111");
    }
    lantai3 = status;
  }
}