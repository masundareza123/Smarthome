import 'dart:async';
import 'dart:io';

import 'package:homeauto/constants/const.dart';
import 'package:homeauto/constants/route_name.dart';
import 'package:homeauto/locator.dart';
import 'package:homeauto/services/navigator_service.dart';
import 'package:homeauto/viewmodels/base_model.dart';

class StartUpViewModel extends BaseModel{
  final NavigationService _navigationService = locator<NavigationService>();

  startTimer() async {
    var _duration = Duration(seconds: 5);
    return Timer(_duration, handleStartUpLogic);
  }

  Future handleStartUpLogic() async {
    _navigationService.replaceTo(HomeViewRoute);
  }
}
