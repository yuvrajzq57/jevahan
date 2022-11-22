import 'package:flutter/cupertino.dart';
import 'package:jevahan/Models/address.dart';

class AppData extends ChangeNotifier {
  Address? PickupLocation;
  Address? dropOffLocation;

  void updateuserPickupLocationAddress(Address pickupAddress) {
    PickupLocation = pickupAddress;
    notifyListeners();
  }

  void updateDropOffLocationAddress(Address dropOffAddress) {
    dropOffLocation = dropOffAddress;
    notifyListeners();
  }

  void updatePickupLocationAddress(Address userPickupAddress) {}
}
