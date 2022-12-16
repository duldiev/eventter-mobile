import 'package:dio/dio.dart';
import 'package:dio_logger/dio_logger.dart';
import 'package:flutter_mobile/data/models/event.dart';
import 'package:flutter_mobile/data/models/event_post.dart';
import 'package:flutter_mobile/helper/constant_uri.dart';

class EventterApiClient {
  final _baseUrl = ConstantURI.baseUrl;

  Future<List<Event>> getAllEvents() async {
    final Dio dio = Dio(BaseOptions(baseUrl: _baseUrl, method: 'GET'));
    final response = await dio.request(ConstantURI.eventAll);
    if (response.statusCode == 200) {
      final result = response.data as List;
      return result.map((dynamic json) {
        final map = json as Map<String, dynamic>;
        return Event.fromJson(map);
      }).toList();
    }
    throw Exception('error fetching character');
  }

  Future<void> postEvent(EventPost event) async {
    EventPost? retrievedEvent;
    final Dio dio = Dio();
    dio.interceptors.add(dioLoggerInterceptor);
    print(event.toJson());
    try {
      final response = await dio.post(
        _baseUrl + ConstantURI.eventCreate,
        data: event.toJson(),
      );
    } catch (e) {
      print(e);
    }
  }
}
