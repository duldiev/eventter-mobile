// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile/logic/blocs/draggable_sheet_controller/draggable_sheet_controller_bloc.dart';
import 'package:flutter_mobile/logic/cubits/current_location/current_location_cubit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsView extends StatefulWidget {
  const GoogleMapsView({super.key});

  @override
  State<GoogleMapsView> createState() => _GoogleMapsViewState();
}

class _GoogleMapsViewState extends State<GoogleMapsView> {
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Completer<GoogleMapController> mapController = Completer();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentLocationCubit, CurrentLocationState>(
      builder: (context, state) {
        if (state is CurrentLocationLoaded) {
          final CameraPosition position = CameraPosition(
            target: LatLng(
              state.currentLocatoin.latitude,
              state.currentLocatoin.longitude,
            ),
            zoom: 14.4746,
          );
        }
        return _buildMap(_kGooglePlex);
      },
    );
  }

  GoogleMap _buildMap(CameraPosition position) {
    return GoogleMap(
      initialCameraPosition: position,
      myLocationButtonEnabled: false,
      onTap: (_) {
        context.read<DraggableSheetBloc>().add(
              DraggableSheetMinimize(),
            );
        print(context.read<DraggableSheetBloc>().state.size);
      },
      onMapCreated: (GoogleMapController controller) {
        mapController.complete(controller);
      },
    );
  }
}
