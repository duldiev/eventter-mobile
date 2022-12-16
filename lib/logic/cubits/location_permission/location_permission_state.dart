part of 'location_permission_cubit.dart';

abstract class LocationPermissionState extends Equatable {
  const LocationPermissionState();

  @override
  List<Object> get props => [];
}

class LocationPermissionInitial extends LocationPermissionState {}

class LocationPermissionServiceDisabled extends LocationPermissionState {}

class LocationPermissionPermissionDenied extends LocationPermissionState {}

class LocationPermissionPermissionDeniedForever
    extends LocationPermissionState {}

class LocationPermissionPermissionAccessed extends LocationPermissionState {}
