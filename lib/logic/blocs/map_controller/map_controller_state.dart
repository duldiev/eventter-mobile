part of 'map_controller_bloc.dart';

abstract class MapControllerState extends Equatable {
  const MapControllerState();
  
  @override
  List<Object> get props => [];
}

class MapControllerInitial extends MapControllerState {}
