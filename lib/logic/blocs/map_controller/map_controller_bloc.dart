import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'map_controller_event.dart';
part 'map_controller_state.dart';

class MapControllerBloc extends Bloc<MapControllerEvent, MapControllerState> {
  MapControllerBloc() : super(MapControllerInitial()) {
    on<MapControllerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
