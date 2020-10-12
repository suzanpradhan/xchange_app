import 'package:connectivity/connectivity.dart';

class ConnectivityStatus {
  connectivityStatus() async {
    var connectivity = await (Connectivity().checkConnectivity());
    if ((connectivity == ConnectivityResult.mobile) ||
        (connectivity == ConnectivityResult.mobile)) {
      return "Connected";
    } else {
      return "Disconnected";
    }
  }
}
