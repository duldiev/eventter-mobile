// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_mobile/helper/constants.dart';

class SmallInterestCard extends StatelessWidget {
  final int index;
  const SmallInterestCard({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            "https://st.depositphotos.com/1002111/2556/i/950/depositphotos_25565783-stock-photo-young-party-people.jpg",
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(Constants.radius1),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.red.withOpacity(0.92),
                  Colors.blue.withOpacity(0.92),
                ],
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Icon(
              Icons.play_arrow,
              color: Theme.of(context).colorScheme.primaryContainer,
              size: 30,
            ),
          ),
          Positioned(
            left: 10,
            bottom: 20,
            child: Text(
              "Party",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primaryContainer,
                fontWeight: FontWeight.w500,
                fontSize: 17,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
