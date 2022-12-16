import 'package:flutter/material.dart';
import 'package:flutter_mobile/helper/constants.dart';
import 'package:flutter_mobile/helper/text_styles.dart';

class InterestCard extends StatelessWidget {
  final String title;
  final String imageTitle;
  const InterestCard({
    super.key,
    required this.title,
    this.imageTitle = "assets/image_icons/cassette.png",
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(
          Constants.radius1,
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Image(
              image: AssetImage(
                "assets/image_icons/${Constants.imageIcon(imageTitle)}",
              ),
              width: 70,
              height: 70,
            ),
          ),
          Expanded(
            child: Subtitle1(title: title),
          )
        ],
      ),
    );
  }
}
