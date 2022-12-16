// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_mobile/helper/constants.dart';
import 'package:flutter_mobile/helper/methods.dart';
import 'package:flutter_mobile/helper/text_styles.dart';
import 'package:flutter_mobile/data/models/event.dart';
import 'package:flutter_mobile/presentation/widgets/buttons/icon_button.dart';
import 'package:flutter_mobile/presentation/widgets/cards/date_card.dart';
import 'package:flutter_mobile/presentation/widgets/others/icon_title.dart';
import 'package:flutter_mobile/presentation/widgets/others/interest_tag.dart';
import 'package:flutter_mobile/presentation/widgets/others/stack_avatars.dart';

class BigEventCard extends StatefulWidget {
  final Event event;
  final bool shadowEnabled;
  final bool isJoined;
  const BigEventCard({
    super.key,
    required this.event,
    this.shadowEnabled = false,
    this.isJoined = false,
  });

  @override
  State<BigEventCard> createState() => _BigEventCardState();
}

class _BigEventCardState extends State<BigEventCard> {
  @override
  Widget build(BuildContext context) {
    final attendees = widget.event.attendees ?? [];
    return Container(
      width: 300,
      height: widget.isJoined ? 280 : 360,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(Constants.bigRadius1),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline,
          width: 0.1,
        ),
        boxShadow: [
          if (widget.shadowEnabled == true) ...[
            BoxShadow(
              color: Theme.of(context).colorScheme.shadow.withOpacity(0.2),
              spreadRadius: -3,
              blurRadius: 10,
            ),
          ]
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Constants.bigRadius4),
                      image: DecorationImage(
                        image: NetworkImage(
                          Methods.showEventPicture(widget.event.photo),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 7,
                  left: 7,
                  child: DateCard(),
                ),
                Positioned(
                  top: 7,
                  right: 7,
                  child: CustomIconButton(
                    onPressed: () {},
                    icon: Icons.bookmark_outline,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Header7(
                  title: widget.event.title,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
              right: 10,
              left: 10,
            ),
            child: Row(
              children: [
                if (attendees.isNotEmpty) ...[
                  Expanded(
                    flex: 4,
                    child: StackAvatars(
                      attendees: attendees,
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Subtitle2(
                      title: "+${attendees.length - 3} attendees",
                      color: Theme.of(context).colorScheme.surfaceTint,
                    ),
                  ),
                ] else ...[
                  Caption(
                    title: "No attendees",
                    color: Theme.of(context).colorScheme.onBackground,
                  )
                ]
              ],
            ),
          ),
          if (widget.isJoined == false) ...[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: IconTitle(
                  icon: Icons.person,
                  title:
                      "${widget.event.owner.firstName} ${widget.event.owner.lastName}",
                  iconColor: Theme.of(context).colorScheme.onSurfaceVariant,
                  titleColor: Theme.of(context).colorScheme.onSurfaceVariant,
                  isCaption: true,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: IconTitle(
                  icon: Icons.location_on,
                  title: widget.event.address ?? "No location",
                  iconColor: Theme.of(context).colorScheme.onSurfaceVariant,
                  titleColor: Theme.of(context).colorScheme.onSurfaceVariant,
                  isCaption: true,
                ),
              ),
            ),
          ],
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.event.interests.length,
              padding: EdgeInsets.only(
                top: 8,
                right: 10,
                left: 10,
                bottom: 8,
              ),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(right: 10),
                child: InterestTag(
                  title: widget.event.interests[index].title,
                  index: 1,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
