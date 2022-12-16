// ignore_for_file: prefer_const_constructors

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile/app.dart';
import 'package:flutter_mobile/data/repositories/event_repository.dart';
import 'package:flutter_mobile/eventter_bloc_observer.dart';
import 'package:flutter_mobile/services/api_client.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = EventterBlocObserver();
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          lazy: true,
          create: (_) => EventsRepository(api: EventterApiClient()),
        ),
      ],
      child: EventterApp(),
    ),
  );
}
