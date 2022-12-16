import 'package:flutter_mobile/data/models/event.dart';
import 'package:flutter_mobile/data/models/event_post.dart';
import 'package:flutter_mobile/services/api_client.dart';

abstract class IEventsRepository {
  Future<List<Event>> getAllEvents();
}

class EventsRepository implements IEventsRepository {
  final EventterApiClient api;

  EventsRepository({required this.api});

  @override
  Future<List<Event>> getAllEvents() => api.getAllEvents();

  Future<void> postEvent(EventPost event) => api.postEvent(event);
}
