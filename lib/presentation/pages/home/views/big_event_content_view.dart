// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile/logic/cubits/events/events_cubit.dart';
import 'package:flutter_mobile/presentation/widgets/cards/big_event_card.dart';
import 'package:flutter_mobile/presentation/widgets/others/icon_title.dart';

class BigEventContentView extends StatefulWidget {
  final String title;
  final IconData icon;
  const BigEventContentView({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  State<BigEventContentView> createState() => _BigEventContentViewState();
}

class _BigEventContentViewState extends State<BigEventContentView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 420,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 20),
            child: IconTitle(icon: widget.icon, title: widget.title),
          ),
          SizedBox(
            height: 340,
            child: BlocBuilder<EventsCubit, EventsState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.events.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/event',
                            arguments: state.events[index],
                          );
                        },
                        child: BigEventCard(
                          event: state.events[index],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
