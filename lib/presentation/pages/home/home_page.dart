// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile/logic/blocs/draggable_sheet_controller/draggable_sheet_controller_bloc.dart';
import 'package:flutter_mobile/logic/cubits/current_location/current_location_cubit.dart';
import 'package:flutter_mobile/logic/cubits/events/events_cubit.dart';
import 'package:flutter_mobile/logic/cubits/location_permission/location_permission_cubit.dart';
import 'package:flutter_mobile/presentation/pages/home/views/draggable_bottom_sheet.dart';
import 'package:flutter_mobile/presentation/pages/home/views/google_maps_view.dart';
import 'package:flutter_mobile/presentation/widgets/buttons/icon_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _padding = 0;

  @override
  Widget build(BuildContext context) {
    final cont = context.read<LocationPermissionCubit>();
    context.read<EventsCubit>().getEvents();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              return AnimatedContainer(
                duration: Duration(seconds: 1),
                padding: EdgeInsets.all(_padding),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(_padding),
                ),
                curve: Curves.fastOutSlowIn,
                constraints: constraints,
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                child: GoogleMapsView(),
              );
            },
          ),
          Positioned(
            top: 315,
            right: 10,
            child: CustomIconButton(
              onPressed: () {
                if (context.read<DraggableSheetBloc>().state.size == 1.0) {
                  setState(() => _padding = 20);
                } else {
                  setState(() => _padding = 0);
                }
                context.read<DraggableSheetBloc>().add(
                      DraggableSheetMinimize(),
                    );
                context
                    .read<CurrentLocationCubit>()
                    .getCurrentPosition(cont.state);
              },
              icon: Icons.my_location_sharp,
              opacityEnabled: false,
            ),
          ),
          SafeArea(
              child: DraggableBottomSheet(
            notifyParent: refresh,
          )),
        ],
      ),
    );
  }

  void refresh() {
    setState(() {});
  }
}
