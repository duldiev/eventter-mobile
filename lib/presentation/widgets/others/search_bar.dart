// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile/helper/constants.dart';
import 'package:flutter_mobile/logic/blocs/draggable_sheet_controller/draggable_sheet_controller_bloc.dart';

class SearchBar extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final void Function(String)? onChange;
  final void Function(String)? onSubmited;
  final Function? validator;
  final TextInputType inputType;
  const SearchBar({
    super.key,
    this.hintText = "Hint",
    this.controller,
    this.onChange,
    this.onSubmited,
    this.validator,
    this.inputType = TextInputType.text,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceTint.withOpacity(0.05),
        borderRadius: BorderRadius.circular(Constants.radius1),
      ),
      child: Row(
        children: [
          Expanded(
            child: Icon(
              Icons.search,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 9,
            child: TextField(
              onTap: () {
                context
                    .read<DraggableSheetBloc>()
                    .add(DraggableSheetMaximizeEdge());
              },
              controller: widget.controller,
              onChanged: widget.onChange,
              onSubmitted: widget.onSubmited,
              autocorrect: false,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
                contentPadding: EdgeInsets.only(bottom: 3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
