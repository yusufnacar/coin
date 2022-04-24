import 'package:flutter/material.dart';

enum ServiceRequestStatus {
  Initial,
  Loading,
  Success,
  Error,
}

class StateProvider extends ChangeNotifier {
  ServiceRequestStatus _status = ServiceRequestStatus.Loading;

  ServiceRequestStatus get status => _status;

  void changeStatus(ServiceRequestStatus status) {
    _status = status;
    notifyListeners();
  }
}
