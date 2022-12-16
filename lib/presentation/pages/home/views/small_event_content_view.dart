// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_mobile/presentation/widgets/cards/small_interest_card.dart';
import 'package:flutter_mobile/presentation/widgets/others/icon_title.dart';

class SmallEventContentView extends StatelessWidget {
  final String title;
  final IconData icon;
  const SmallEventContentView({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: IconTitle(icon: icon, title: title),
            ),
          ),
          Expanded(
            flex: 4,
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 20, right: 20),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: SmallInterestCard(
                    index: index,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
