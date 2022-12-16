// ignore_for_file: avoid_classes_with_only_static_members

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_mobile/logic/blocs/network/network_bloc.dart';

class NetworkHelper {
  static Future<void> observeNetwork() async =>
      Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) {
          if (result == ConnectivityResult.none) {
            NetworkBloc().add(const NetworkNotifyEvent());
          } else {
            NetworkBloc().add(const NetworkNotifyEvent(isConnected: true));
          }
        },
      );
}
