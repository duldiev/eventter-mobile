// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_mobile/helper/methods.dart';
import 'package:flutter_mobile/helper/text_styles.dart';
import 'package:flutter_mobile/data/models/event.dart';
import 'package:flutter_mobile/presentation/widgets/buttons/main_button.dart';
import 'package:flutter_mobile/presentation/widgets/others/stack_avatars.dart';

class EventPage extends StatefulWidget {
  final Event event;
  const EventPage({super.key, required this.event});

  @override
  State<EventPage> createState() => _EventPageState();
}

const imageURL =
    "https://cdn.dribbble.com/users/667262/screenshots/11081109/media/efbac63ac18d60b536e9a1723751d613.png?compress=1&resize=1600x1200&vertical=top";

class _EventPageState extends State<EventPage> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final attendees = widget.event.attendees ?? [];
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0.0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            size: 24,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.star_outline,
                size: 24,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(Methods.showEventPicture(widget.event.photo)),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: SafeArea(
            bottom: false,
            child: SizedBox(
              height: 800,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      padding: EdgeInsets.only(top: 100, right: 20, left: 20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.89),
                            Colors.black.withOpacity(0.97),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.0, 0.2, 0.35],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Header4(
                            title: widget.event.title,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              EventDate(widget: widget),
                              EventTime(widget: widget),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          EventLocation(widget: widget),
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (attendees.isNotEmpty) ...[
                                Expanded(
                                  child: StackAvatars(
                                    height: 35,
                                    isDetailed: true,
                                    attendees: widget.event.attendees ?? [],
                                  ),
                                ),
                              ] else ...[
                                Subtitle1(
                                  title: "No attendees",
                                  color: Colors.white,
                                ),
                              ],
                              OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                child: Subtitle1(
                                  title: "Invite",
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          Header6(
                            title: "Description",
                            color: Colors.white,
                          ),
                          SizedBox(height: 20),
                          BodyText2(
                            title: widget.event.description,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            width: double.maxFinite,
                            child: MainButton(
                              title: "join",
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EventDate extends StatelessWidget {
  const EventDate({
    super.key,
    required this.widget,
  });

  final EventPage widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.calendar_month,
          color: Theme.of(context).colorScheme.primary,
          size: 32,
        ),
        SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header6(
              title: widget.event.date,
              color: Colors.white,
            ),
            BodyText1(
              title: "Thursday",
              color: Colors.grey,
            ),
          ],
        )
      ],
    );
  }
}

class EventTime extends StatelessWidget {
  const EventTime({
    super.key,
    required this.widget,
  });

  final EventPage widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.access_time,
          color: Theme.of(context).colorScheme.primary,
          size: 32,
        ),
        SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header6(
              title: widget.event.time,
              color: Colors.white,
            ),
            BodyText1(
              title: widget.event.duration,
              color: Colors.grey,
            ),
          ],
        )
      ],
    );
  }
}

class EventLocation extends StatelessWidget {
  const EventLocation({
    super.key,
    required this.widget,
  });

  final EventPage widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.location_on,
              color: Theme.of(context).colorScheme.primary,
              size: 32,
            ),
            SizedBox(width: 15),
            Header6(
              title: widget.event.address ?? "No Location",
              color: Colors.white,
            ),
          ],
        ),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          child: Subtitle1(
            title: "Map",
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
