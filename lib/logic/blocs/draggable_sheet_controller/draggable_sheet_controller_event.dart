part of 'draggable_sheet_controller_bloc.dart';

abstract class DraggableSheetEvent extends Equatable {
  const DraggableSheetEvent();

  @override
  List<Object> get props => [];
}

class DraggableSheetAnimate extends DraggableSheetEvent {
  final double size;
  const DraggableSheetAnimate({required this.size});

  @override
  List<Object> get props => [size];
}

class DraggableSheetMinimize extends DraggableSheetEvent {
  const DraggableSheetMinimize();
}

class DraggableSheetMinimizeEdge extends DraggableSheetEvent {
  const DraggableSheetMinimizeEdge();
}

class DraggableSheetMaximize extends DraggableSheetEvent {
  const DraggableSheetMaximize();
}

class DraggableSheetMaximizeEdge extends DraggableSheetEvent {
  const DraggableSheetMaximizeEdge();
}
