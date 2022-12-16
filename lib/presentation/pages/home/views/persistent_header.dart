// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class PersistentHeader extends SliverPersistentHeaderDelegate {
  final Widget widget;

  PersistentHeader({required this.widget});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      width: double.maxFinite,
      height: 140.0,
      padding: EdgeInsets.only(top: 15, right: 20, left: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
      ),
      child: Card(
        margin: EdgeInsets.all(0),
        surfaceTintColor: Theme.of(context).colorScheme.background,
        elevation: 0.0,
        child: Center(child: widget),
      ),
    );
  }

  @override
  double get maxExtent => 110.0;

  @override
  double get minExtent => 100.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
