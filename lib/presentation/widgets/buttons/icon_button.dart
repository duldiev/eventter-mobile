import 'package:flutter/material.dart';
import 'package:flutter_mobile/helper/constants.dart';

class CustomIconButton extends StatelessWidget {
  final void Function() onPressed;
  final IconData icon;
  final double iconSize;
  final bool opacityEnabled;
  final Color color;
  final Color iconColor;
  const CustomIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.iconSize = 24,
    this.opacityEnabled = true,
    this.color = Colors.red,
    this.iconColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: opacityEnabled
              ? Theme.of(context).colorScheme.background.withOpacity(0.75)
              : (color == Colors.red
                  ? Theme.of(context).colorScheme.background
                  : color),
          borderRadius: BorderRadius.circular(Constants.radius3),
        ),
        child: Icon(
          icon,
          size: iconSize,
          color: iconColor == Colors.black
              ? Theme.of(context).colorScheme.onBackground
              : iconColor,
        ),
      ),
    );
  }
}
