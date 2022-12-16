// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final EdgeInsets padding;
  const ProfileAvatar({
    super.key,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: CircleAvatar(
        backgroundColor: Colors.white.withOpacity(0.7),
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: ClipOval(
            child: Image(
              image: NetworkImage(
                  "https://www.w3schools.com/howto/img_avatar.png"),
            ),
          ),
        ),
      ),
    );
  }
}
