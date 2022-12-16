// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobile/helper/text_styles.dart';
import 'package:flutter_mobile/data/models/profile.dart';
import 'package:flutter_mobile/presentation/widgets/others/profile_avatar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StackAvatars extends StatefulWidget {
  final double height;
  final bool isDetailed;
  final List<Profile> attendees;
  const StackAvatars({
    super.key,
    this.height = 30,
    this.isDetailed = false,
    required this.attendees,
  });

  @override
  State<StackAvatars> createState() => _StackAvatarsState();
}

class _StackAvatarsState extends State<StackAvatars> {
  @override
  Widget build(BuildContext context) {
    final int numberOfAttendees = widget.attendees.length;
    return Container(
      width: double.maxFinite,
      height: widget.height,
      child: Stack(
        children: [
          for (int i = 0; i < min(numberOfAttendees, 3); i++) ...[
            Positioned(
              left: widget.height / 30 * (25 * i),
              top: 0,
              bottom: 0,
              child: ProfileAvatar(),
            ),
          ],
          if (widget.isDetailed && numberOfAttendees > 3) ...[
            Positioned(
              left: widget.height / 30 * 75,
              top: 0,
              bottom: 0,
              child: CircleAvatar(
                child: BodyText1(
                  title: "+${numberOfAttendees - 3}",
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ]
        ],
      ),
    );
  }
}
