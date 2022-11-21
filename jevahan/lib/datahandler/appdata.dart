import 'package:flutter/cupertino.dart';
import 'package:jevahan/Models/address.dart';

class AppData extends ChangeNotifier {
  late Address PickupLocation;

  void updateuserPickupLocationAddress(Address pickupAddress) {
    PickupLocation = pickupAddress;
    notifyListeners();
  }

  void updatePickupLocationAddress(Address userPickupAddress) {}
}
