// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_mobile/helper/constants.dart';
import 'package:flutter_mobile/helper/text_styles.dart';

class SmallEventCard extends StatelessWidget {
  const SmallEventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: 10,
        left: 10,
        top: 10,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Constants.bigRadius2),
        color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
      ),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Constants.bigRadius2),
              image: DecorationImage(
                image: NetworkImage(
                  "https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header7(title: "Event title"),
              Caption(title: "08:00 AM to 09:00 AM"),
              Caption(title: "Astana"),
            ],
          ),
        ],
      ),
    );
  }
}
