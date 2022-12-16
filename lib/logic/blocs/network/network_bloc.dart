import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_mobile/services/network_helper.dart';

part 'network_event.dart';
part 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  static final NetworkBloc _instance = NetworkBloc._();

  factory NetworkBloc() => _instance;

  NetworkBloc._() : super(NetworkInitialState()) {
    on<NetworkObserveEvent>(_observe);
    on<NetworkNotifyEvent>(_notifyStatus);
  }

  void _observe(event, emit) {
    NetworkHelper.observeNetwork();
  }

  void _notifyStatus(NetworkNotifyEvent event, Emitter<NetworkState> emit) {
    event.isConnected
        ? emit(NetworkSuccessState())
        : emit(NetworkFailureState());
  }
}
