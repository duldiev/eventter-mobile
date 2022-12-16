// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_mobile/helper/constants.dart';
import 'package:flutter_mobile/helper/text_styles.dart';

class InterestTag extends StatefulWidget {
  final String title;
  final int index;
  const InterestTag({
    super.key,
    required this.title,
    required this.index,
  });

  @override
  State<InterestTag> createState() => _InterestTagState();
}

class _InterestTagState extends State<InterestTag> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(
        top: 2,
        bottom: 2,
        right: 15,
        left: 15,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(
          Constants.radius1,
        ),
      ),
      child: Label2(
        title: widget.title.toUpperCase(),
        color: Theme.of(context).colorScheme.surfaceTint,
      ),
    );
  }
}
