import 'package:scoped_model/scoped_model.dart';

class DonationModel extends Model {
  int _count = 0;
  bool _donatedClicked = false;
  get count => _count;
  get donClick => _donatedClicked;

  set donClick(bool donate) {
    if (donate == null) {
      throw ArgumentError();
    }
    _donatedClicked = donate;
    notifyListeners();
  }

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}
