import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mobile/logic/cubits/location_permission/location_permission_cubit.dart';
import 'package:geolocator/geolocator.dart';
part 'current_location_state.dart';

class CurrentLocationCubit extends Cubit<CurrentLocationState> {
  late LocationSettings locationSettings;

  CurrentLocationCubit() : super(CurrentLocationInitial());

  StreamSubscription<Position>? positionStream;

  Future<void> getCurrentPosition(
    LocationPermissionState locationPermissionState,
  ) async {
    if (locationPermissionState is! LocationPermissionPermissionAccessed) {
      return;
    }

    if (defaultTargetPlatform == TargetPlatform.android) {
      locationSettings = AndroidSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
        forceLocationManager: true,
        intervalDuration: const Duration(seconds: 10),
        foregroundNotificationConfig: const ForegroundNotificationConfig(
          notificationText:
              "Example app will continue to receive your location even when you aren't using it",
          notificationTitle: "Running in Background",
          enableWakeLock: true,
        ),
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      locationSettings = AppleSettings(
        accuracy: LocationAccuracy.high,
        activityType: ActivityType.fitness,
        distanceFilter: 100,
        pauseLocationUpdatesAutomatically: true,
      );
    } else {
      locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      );
    }

    positionStream?.cancel();
    positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position? position) {
      position == null
          ? emit(CurrentLocationError())
          : emit(CurrentLocationLoaded(currentLocatoin: position));
    });
  }

  void cancelSubscription() {
    positionStream?.cancel();
  }
}
