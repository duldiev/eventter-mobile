// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile/helper/color_schemes.g.dart';
import 'package:flutter_mobile/data/repositories/event_repository.dart';
import 'package:flutter_mobile/logic/blocs/network/network_bloc.dart';
import 'package:flutter_mobile/logic/cubits/events/events_cubit.dart';
import 'package:flutter_mobile/presentation/routing/app_router.dart';
import 'package:flutter_mobile/services/api_client.dart';

class EventterApp extends StatelessWidget {
  const EventterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => NetworkBloc()..add(NetworkObserveEvent()),
        ),
        BlocProvider(
          create: (_) => EventsCubit(context.read<EventsRepository>()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
          fontFamily: 'Ubuntu',
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: darkColorScheme,
          fontFamily: 'Ubuntu',
        ),
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
