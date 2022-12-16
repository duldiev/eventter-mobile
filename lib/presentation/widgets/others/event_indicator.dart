// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class EventIndicator extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final String text;
  const EventIndicator({
    super.key,
    required this.icon,
    required this.text,
    this.iconSize = 80,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: iconSize,
              color: Theme.of(context).disabledColor,
            ),
            SizedBox(height: 20),
            Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Theme.of(context).disabledColor,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
