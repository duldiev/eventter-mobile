// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile/data/models/event.dart';
import 'package:flutter_mobile/logic/cubits/location_permission/location_permission_cubit.dart';
import 'package:flutter_mobile/presentation/pages/event/event_page.dart';
import 'package:flutter_mobile/presentation/screens/login/login_screen.dart';
import 'package:flutter_mobile/presentation/screens/register/register_screen.dart';
import 'package:flutter_mobile/presentation/screens/tab_bar/main_tab_bar.dart';

class AppRoutes {
  static const loginPage = '/login';
  static const registerPage = '/register';
  static const tabBarPage = '/tab-bar';
  static const eventPage = '/event';
}

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => LocationPermissionCubit(),
            child: const MainTabBar(),
          ),
        );
      case AppRoutes.loginPage:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case AppRoutes.registerPage:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case AppRoutes.eventPage:
        final event = settings.arguments! as Event;
        return MaterialPageRoute(
          builder: (_) => EventPage(
            event: event,
          ),
        );
      default:
        return null;
    }
  }
}
