import 'package:flutter/material.dart';
import 'package:flutter_mobile/helper/text_styles.dart';

class IconTitle extends StatelessWidget {
  final IconData icon;
  final String title;
  final double titleSize;
  final double iconSize;
  final Color iconColor;
  final Color titleColor;
  final bool isCaption;
  const IconTitle({
    super.key,
    required this.icon,
    required this.title,
    this.titleSize = 24,
    this.iconSize = 24,
    this.iconColor = Colors.red,
    this.titleColor = Colors.red,
    this.isCaption = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Icon(
              icon,
              size: isCaption ? 20 : iconSize,
              color: iconColor == Colors.red
                  ? Theme.of(context).colorScheme.primary
                  : iconColor,
            ),
          ),
        ),
        Expanded(
          flex: 8,
          child: Align(
            alignment: Alignment.centerLeft,
            child: isCaption
                ? Caption(
                    title: title,
                    color: titleColor,
                  )
                : Subtitle2(
                    title: title,
                    color: titleColor,
                  ),
          ),
        )
      ],
    );
  }
}
