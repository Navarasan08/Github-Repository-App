

import 'package:flutter/material.dart';

enum ViewState{ busy, idle }

class BaseModel extends ChangeNotifier {

  ViewState _state = ViewState.idle;
  ViewState get viewState => _state;
  setBusy(bool state){
    _state = state ? ViewState.busy : ViewState.idle;
    notifyListeners();
  }

}