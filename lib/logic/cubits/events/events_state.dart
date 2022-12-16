part of 'events_cubit.dart';

enum EventStatus { initial, loading, success, failure }

class EventsState extends Equatable {
  final EventStatus status;
  final List<Event> events;

  const EventsState({
    this.status = EventStatus.initial,
    List<Event>? events,
  }) : events = events ?? const <Event>[];

  EventsState copyWith({
    EventStatus? status,
    List<Event>? events,
  }) {
    return EventsState(
      status: status ?? this.status,
      events: events ?? this.events,
    );
  }

  @override
  List<Object> get props => [status, events];
}
