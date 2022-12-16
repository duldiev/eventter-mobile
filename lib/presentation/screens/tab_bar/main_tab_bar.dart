// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile/logic/blocs/draggable_sheet_controller/draggable_sheet_controller_bloc.dart';
import 'package:flutter_mobile/logic/cubits/current_location/current_location_cubit.dart';
import 'package:flutter_mobile/presentation/pages/create/create_event_page.dart';
import 'package:flutter_mobile/presentation/pages/home/home_page.dart';
import 'package:flutter_mobile/presentation/pages/profile/profile_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainTabBar extends StatefulWidget {
  const MainTabBar({super.key});

  @override
  State<MainTabBar> createState() => _MainTabBarState();
}

class _MainTabBarState extends State<MainTabBar> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = [
    HomePage(),
    CreateEventPage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  Widget _widget() {
    switch (_selectedIndex) {
      case 0:
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => CurrentLocationCubit()),
            BlocProvider(
              create: (_) => DraggableSheetBloc(
                controller: DraggableScrollableController(),
              ),
            ),
          ],
          child: _widgetOptions.elementAt(_selectedIndex),
        );
      case 1:
        return _widgetOptions.elementAt(_selectedIndex);
      case 2:
        return _widgetOptions.elementAt(_selectedIndex);
    }
    return Center(child: CircularProgressIndicator());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: _widget(),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(top: 5, bottom: 5),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          boxShadow: [
            if (_selectedIndex > 0) ...[
              BoxShadow(
                color: Theme.of(context).colorScheme.shadow,
                spreadRadius: 5,
                blurRadius: 20,
                offset: const Offset(0, 25), // changes position of shadow
              ),
            ]
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 8),
            child: _bottomNavigationBar(context),
          ),
        ),
      ),
    );
  }

  GNav _bottomNavigationBar(BuildContext context) {
    return GNav(
      rippleColor: Theme.of(context).colorScheme.shadow.withOpacity(0.2),
      hoverColor: Theme.of(context).colorScheme.shadow.withOpacity(0.2),
      gap: 5,
      activeColor: Theme.of(context).colorScheme.primary,
      iconSize: 26,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
      duration: Duration(milliseconds: 200),
      tabBackgroundColor:
          Theme.of(context).colorScheme.outline.withOpacity(0.1),
      color: Theme.of(context).colorScheme.outline,
      tabs: [
        GButton(
          icon: CupertinoIcons.house_fill,
          iconSize: 22,
        ),
        GButton(
          icon: CupertinoIcons.plus_app,
          iconSize: 22,
        ),
        GButton(
          icon: CupertinoIcons.person_fill,
          iconSize: 22,
        ),
      ],
      selectedIndex: _selectedIndex,
      onTabChange: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }
}
