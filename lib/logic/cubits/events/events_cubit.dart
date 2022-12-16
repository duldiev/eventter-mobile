import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_mobile/data/models/event.dart';
import 'package:flutter_mobile/data/models/event_post.dart';
import 'package:flutter_mobile/data/repositories/event_repository.dart';

part 'events_state.dart';

class EventsCubit extends Cubit<EventsState> {
  final EventsRepository _eventsRepository;

  EventsCubit(this._eventsRepository) : super(const EventsState()) {
    getEvents();
  }

  Future<void> postEvent(EventPost event) async {
    emit(state.copyWith(status: EventStatus.loading));
    try {
      _eventsRepository.postEvent(event);
      emit(state.copyWith(status: EventStatus.success));
    } on Exception {
      emit(state.copyWith(status: EventStatus.failure));
    }
  }

  Future<void> getEvents() async {
    emit(state.copyWith(status: EventStatus.loading));

    try {
      final events = await _eventsRepository.getAllEvents();
      emit(
        state.copyWith(
          status: EventStatus.success,
          events: events,
        ),
      );
    } on Exception {
      emit(state.copyWith(status: EventStatus.failure));
    }
  }
}
