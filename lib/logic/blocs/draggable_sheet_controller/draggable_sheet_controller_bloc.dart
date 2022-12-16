import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'draggable_sheet_controller_event.dart';
part 'draggable_sheet_controller_state.dart';

class DraggableSheetBloc
    extends Bloc<DraggableSheetEvent, DraggableSheetState> {
  DraggableSheetBloc({
    required this.controller,
  }) : super(DraggableSheetMid(controller: controller)) {
    on<DraggableSheetMinimize>(_minimize);
    on<DraggableSheetMaximize>(_maximize);
    on<DraggableSheetMaximizeEdge>(_maximizeEdge);
    // on<DraggableSheetMinimizeEdge>();
    on<DraggableSheetAnimate>(_animate);
  }

  final DraggableScrollableController controller;
  final double _minExtent = 0.15;
  final double _midExtent = 0.5;
  final double _maxExtent = 1.0;

  void _animateController(double size) {
    controller.animateTo(
      size,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void _minimize(
    DraggableSheetMinimize event,
    Emitter<DraggableSheetState> emit,
  ) {
    if (controller.size == _maxExtent) {
      _animateController(_midExtent);
      emit(DraggableSheetMid(controller: controller));
    } else {
      _animateController(_minExtent);
      emit(DraggableSheetMin(controller: controller));
    }
  }

  void _maximizeEdge(
    DraggableSheetMaximizeEdge event,
    Emitter<DraggableSheetState> emit,
  ) {
    if (controller.size == _minExtent) {
      _animateController(_maxExtent);
      emit(DraggableSheetMax(controller: controller));
    }
  }

  void _maximize(
    DraggableSheetMaximize event,
    Emitter<DraggableSheetState> emit,
  ) {
    if (controller.size == _minExtent) {
      _animateController(_midExtent);
      emit(DraggableSheetMid(controller: controller));
    } else {
      _animateController(_maxExtent);
      emit(DraggableSheetMax(controller: controller));
    }
  }

  void _animate(
    DraggableSheetAnimate event,
    Emitter<DraggableSheetState> emit,
  ) {
    controller.addListener(() {
      if (controller.size == _maxExtent) {
        emit(DraggableSheetMax(controller: controller));
      } else if (controller.size == _minExtent) {
        emit(DraggableSheetMin(controller: controller));
      } else {
        emit(DraggableSheetCurrent(
          currentSize: controller.size,
          controller: controller,
        ));
      }
    });
  }

  @override
  Future<void> close() {
    controller.removeListener(() {});
    return super.close();
  }
}
