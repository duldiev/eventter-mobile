// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile/helper/constants.dart';
import 'package:flutter_mobile/data/repositories/event_repository.dart';
import 'package:flutter_mobile/logic/blocs/draggable_sheet_controller/draggable_sheet_controller_bloc.dart';
import 'package:flutter_mobile/logic/cubits/events/events_cubit.dart';
import 'package:flutter_mobile/presentation/pages/home/views/big_event_content_view.dart';
import 'package:flutter_mobile/presentation/pages/home/views/persistent_header.dart';
import 'package:flutter_mobile/presentation/pages/home/views/small_event_content_view.dart';
import 'package:flutter_mobile/presentation/widgets/others/search_bar.dart';

class DraggableBottomSheet extends StatefulWidget {
  final Function() notifyParent;
  const DraggableBottomSheet({
    super.key,
    required this.notifyParent,
  });

  @override
  State<DraggableBottomSheet> createState() => _DraggableBottomSheetState();
}

class _DraggableBottomSheetState extends State<DraggableBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DraggableSheetBloc, DraggableSheetState>(
      builder: (context, state) {
        return DraggableScrollableSheet(
          controller: state.controller,
          minChildSize: 0.15,
          snap: true,
          snapSizes: const [0.15, 0.55, 1.0],
          builder: (context, scrollController) {
            return Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Constants.bigRadius2),
                  topRight: Radius.circular(Constants.bigRadius2),
                ),
                boxShadow: [
                  BoxShadow(
                    color:
                        Theme.of(context).colorScheme.shadow.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: CustomScrollView(
                controller: scrollController,
                slivers: [
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: PersistentHeader(
                      widget: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              context.read<DraggableSheetBloc>().add(
                                    DraggableSheetMinimize(),
                                  );
                            },
                            child: Container(
                              height: 5,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Theme.of(context)
                                    .colorScheme
                                    .outline
                                    .withOpacity(0.8),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          InkWell(
                            onTap: () {
                              context
                                  .read<DraggableSheetBloc>()
                                  .add(DraggableSheetMaximizeEdge());
                              widget.notifyParent();
                            },
                            child: SearchBar(
                              hintText: "Поиск инвентов",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        SmallEventContentView(
                          icon: Icons.interests,
                          title: "Interests",
                        ),
                        SizedBox(height: 30),
                        BigEventContentView(
                          icon: Icons.event,
                          title: "Events",
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
