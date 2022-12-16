part of 'network_bloc.dart';

abstract class NetworkState extends Equatable {
  const NetworkState();

  @override
  List<Object> get props => [];
}

class NetworkInitialState extends NetworkState {}

class NetworkSuccessState extends NetworkState {}

class NetworkFailureState extends NetworkState {}
