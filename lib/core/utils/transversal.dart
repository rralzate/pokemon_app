import 'package:connectivity_plus/connectivity_plus.dart';

class Transversal {
  static final Transversal service = Transversal._internal();

  factory Transversal() {
    return service;
  }

  Transversal._internal();

  Future<bool> checkConnectivity() async {
    bool result = false;
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile) {
      result = true;
    }
    return result;
  }

  String fixJson(String json) {
    String jsonFixed = json.replaceAll(r'"{\', '{');
    jsonFixed = jsonFixed.replaceAll(r'}"', '}');
    jsonFixed = jsonFixed.replaceAll(r'\', '');

    return jsonFixed;
  }
}
