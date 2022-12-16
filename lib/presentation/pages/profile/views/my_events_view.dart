// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_mobile/presentation/widgets/cards/small_event_card.dart';
import 'package:timelines/timelines.dart';

class MyEventsView extends StatefulWidget {
  const MyEventsView({super.key});

  @override
  State<MyEventsView> createState() => _MyEventsViewState();
}

class _MyEventsViewState extends State<MyEventsView> {
  @override
  Widget build(BuildContext context) {
    return Timeline.tileBuilder(
      theme: TimelineThemeData(
        color: Theme.of(context).colorScheme.surfaceVariant,
      ),
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(top: 10, right: 10),
      builder: TimelineTileBuilder.fromStyle(
        nodePositionBuilder: (context, index) => 0.2,
        oppositeContentsBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text('Nov. 9\n2022'),
        ),
        contentsBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: SmallEventCard(),
        ),
        itemCount: 10,
      ),
    );
  }
}
