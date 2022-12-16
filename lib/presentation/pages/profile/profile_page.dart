// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_mobile/helper/constants.dart';
import 'package:flutter_mobile/helper/text_styles.dart';
import 'package:flutter_mobile/presentation/pages/profile/views/my_bookmarks_view.dart';
import 'package:flutter_mobile/presentation/pages/profile/views/my_events_view.dart';
import 'package:flutter_mobile/presentation/widgets/others/profile_avatar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: DefaultTabController(
        animationDuration: Duration(milliseconds: 300),
        length: 2,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Header6(
                title: "Profile",
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              scrolledUnderElevation: 0.0,
              automaticallyImplyLeading: false,
              backgroundColor: Theme.of(context).colorScheme.primary,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.maxFinite,
                      height: 120,
                      child: ProfileAvatar(
                        padding: EdgeInsets.symmetric(
                          horizontal: 120,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Header6(
                      title: "Raiymbek Duldiyev",
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ],
                ),
              ),
              expandedHeight: 400,
              pinned: true,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(60),
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: Container(
                    height: 60,
                    margin: EdgeInsets.only(
                      right: 40,
                      left: 40,
                      top: 20,
                      bottom: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .background
                          .withOpacity(0.3),
                      borderRadius: BorderRadius.circular(Constants.radius1),
                    ),
                    child: TabBar(
                      indicatorPadding: EdgeInsets.all(4),
                      indicator: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.circular(Constants.radius2),
                      ),
                      splashFactory: NoSplash.splashFactory,
                      splashBorderRadius:
                          BorderRadius.circular(Constants.radius1),
                      tabs: [
                        Tab(
                          child: TabBarLabel(
                            title: "Events",
                            fontSize: 14,
                          ),
                        ),
                        Tab(
                          child: TabBarLabel(
                            title: "Saved",
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 1000,
                child: TabBarView(
                  children: [
                    MyEventsView(),
                    MyBookmarksView(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
