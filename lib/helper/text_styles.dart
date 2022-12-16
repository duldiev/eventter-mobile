import 'package:flutter/material.dart';

class Header1 extends StatelessWidget {
  final String title;
  final Color color;
  const Header1({
    super.key,
    required this.title,
    this.color = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color == Colors.red
            ? Theme.of(context).colorScheme.onBackground
            : color,
        fontSize: 98,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
      ),
    );
  }
}

class Header2 extends StatelessWidget {
  final String title;
  final Color color;
  const Header2({
    super.key,
    required this.title,
    this.color = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color == Colors.red
            ? Theme.of(context).colorScheme.onBackground
            : color,
        fontSize: 61,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
      ),
    );
  }
}

class Header3 extends StatelessWidget {
  final String title;
  final Color color;
  const Header3({
    super.key,
    required this.title,
    this.color = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color == Colors.red
            ? Theme.of(context).colorScheme.onBackground
            : color,
        fontSize: 49,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class Header4 extends StatelessWidget {
  final String title;
  final Color color;
  const Header4({
    super.key,
    required this.title,
    this.color = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color == Colors.red
            ? Theme.of(context).colorScheme.onBackground
            : color,
        fontSize: 35,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      ),
    );
  }
}

class Header5 extends StatelessWidget {
  final String title;
  final Color color;
  const Header5({
    super.key,
    required this.title,
    this.color = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color == Colors.red
            ? Theme.of(context).colorScheme.onBackground
            : color,
        fontSize: 24,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class Header6 extends StatelessWidget {
  final String title;
  final Color color;
  const Header6({
    super.key,
    required this.title,
    this.color = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color == Colors.red
            ? Theme.of(context).colorScheme.onBackground
            : color,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
      ),
      maxLines: 2,
    );
  }
}

class Header7 extends StatelessWidget {
  final String title;
  final Color color;
  const Header7({
    super.key,
    required this.title,
    this.color = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color == Colors.red
            ? Theme.of(context).colorScheme.onBackground
            : color,
        fontSize: 18,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
      ),
    );
  }
}

class Subtitle1 extends StatelessWidget {
  final String title;
  final Color color;
  final FontWeight fontWeight;
  const Subtitle1({
    super.key,
    required this.title,
    this.color = Colors.red,
    this.fontWeight = FontWeight.w500,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color == Colors.red
            ? Theme.of(context).colorScheme.onBackground
            : color,
        fontSize: 16,
        fontWeight: fontWeight,
        letterSpacing: 0.15,
      ),
    );
  }
}

class Subtitle2 extends StatelessWidget {
  final String title;
  final Color color;
  const Subtitle2({
    super.key,
    required this.title,
    this.color = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color == Colors.red
            ? Theme.of(context).colorScheme.onBackground
            : color,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      ),
    );
  }
}

class BodyText1 extends StatelessWidget {
  final String title;
  final Color color;
  const BodyText1({
    super.key,
    required this.title,
    this.color = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color == Colors.red
            ? Theme.of(context).colorScheme.onBackground
            : color,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      ),
    );
  }
}

class BodyText2 extends StatelessWidget {
  final String title;
  final Color color;
  final FontWeight fontWeight;
  const BodyText2({
    super.key,
    required this.title,
    this.color = Colors.red,
    this.fontWeight = FontWeight.w400,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color == Colors.red
            ? Theme.of(context).colorScheme.onBackground
            : color,
        fontSize: 14,
        fontWeight: fontWeight,
        letterSpacing: 0.25,
      ),
    );
  }
}

class ButtonTitle extends StatelessWidget {
  final String title;
  final Color color;

  const ButtonTitle({
    super.key,
    required this.title,
    this.color = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color == Colors.red
            ? Theme.of(context).colorScheme.onBackground
            : color,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25,
      ),
    );
  }
}

class Caption extends StatelessWidget {
  final String title;
  final Color color;
  final FontWeight fontWeight;
  const Caption({
    super.key,
    required this.title,
    this.color = Colors.red,
    this.fontWeight = FontWeight.w400,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color == Colors.red
            ? Theme.of(context).colorScheme.onBackground
            : color,
        fontSize: 12,
        fontWeight: fontWeight,
        letterSpacing: 0.4,
      ),
    );
  }
}

class OverlineText extends StatelessWidget {
  final String title;
  final Color color;
  const OverlineText({
    super.key,
    required this.title,
    this.color = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color == Colors.red
            ? Theme.of(context).colorScheme.onBackground
            : color,
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5,
      ),
    );
  }
}

class PolicyTermsText extends StatelessWidget {
  final String blackTitle;
  final String blueTitle;
  final Color color;
  const PolicyTermsText({
    super.key,
    required this.blueTitle,
    required this.blackTitle,
    this.color = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    final text = "$blackTitle $blueTitle";
    return Text(
      text,
      style: TextStyle(
        color: color == Colors.red
            ? Theme.of(context).colorScheme.onBackground
            : color,
        fontSize: 12,
        fontWeight: FontWeight.w300,
        overflow: TextOverflow.ellipsis,
      ),
      textAlign: TextAlign.start,
      maxLines: 2,
    );
  }
}

class Label1 extends StatelessWidget {
  final String title;
  final Color color;
  final FontWeight fontWeight;
  const Label1({
    super.key,
    required this.title,
    this.color = Colors.red,
    this.fontWeight = FontWeight.w500,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color == Colors.red
            ? Theme.of(context).colorScheme.onBackground
            : color,
        fontSize: 12,
        fontWeight: fontWeight,
      ),
    );
  }
}

class Label2 extends StatelessWidget {
  final String title;
  final Color color;
  const Label2({
    super.key,
    required this.title,
    this.color = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color == Colors.red
            ? Theme.of(context).colorScheme.onBackground
            : color,
        fontSize: 10,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class TabBarLabel extends StatelessWidget {
  final String title;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  const TabBarLabel({
    super.key,
    required this.title,
    this.color = Colors.red,
    this.fontWeight = FontWeight.w700,
    this.fontSize = 11,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color == Colors.red
            ? Theme.of(context).colorScheme.onBackground
            : color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
