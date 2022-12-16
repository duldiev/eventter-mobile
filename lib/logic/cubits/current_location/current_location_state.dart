part of 'current_location_cubit.dart';

abstract class CurrentLocationState extends Equatable {
  const CurrentLocationState();

  @override
  List<Object> get props => [];
}

class CurrentLocationInitial extends CurrentLocationState {}

class CurrentLocationLoading extends CurrentLocationState {}

class CurrentLocationLoaded extends CurrentLocationState {
  final Position currentLocatoin;

  const CurrentLocationLoaded({required this.currentLocatoin});

  @override
  List<Object> get props => [currentLocatoin];
}

class CurrentLocationError extends CurrentLocationState {}
