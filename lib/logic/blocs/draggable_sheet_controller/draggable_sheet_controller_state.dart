part of 'draggable_sheet_controller_bloc.dart';

abstract class DraggableSheetState extends Equatable {
  final DraggableScrollableController controller;
  final double size;
  const DraggableSheetState({required this.size, required this.controller});

  @override
  List<Object> get props => [size];
}

class DraggableSheetCurrent extends DraggableSheetState {
  const DraggableSheetCurrent({
    required this.currentSize,
    required this.controller,
  }) : super(size: currentSize, controller: controller);

  final double currentSize;
  final DraggableScrollableController controller;

  @override
  List<Object> get props => [currentSize];
}

class DraggableSheetMin extends DraggableSheetState {
  const DraggableSheetMin({
    required this.controller,
  }) : super(size: 0.15, controller: controller);

  final DraggableScrollableController controller;
}

class DraggableSheetMid extends DraggableSheetState {
  const DraggableSheetMid({
    required this.controller,
  }) : super(size: 0.5, controller: controller);

  final DraggableScrollableController controller;
}

class DraggableSheetMax extends DraggableSheetState {
  const DraggableSheetMax({
    required this.controller,
  }) : super(size: 1.0, controller: controller);

  final DraggableScrollableController controller;
}
