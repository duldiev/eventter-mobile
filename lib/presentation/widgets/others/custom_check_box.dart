import 'package:flutter/material.dart';
import 'package:flutter_mobile/helper/constants.dart';

class CustomCheckBox extends StatefulWidget {
  final bool value;
  final void Function(bool?) onChanged;
  const CustomCheckBox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: widget.value,
      onChanged: widget.onChanged,
      checkColor: Theme.of(context).colorScheme.onPrimary,
      activeColor: Theme.of(context).colorScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          Constants.radius5,
        ),
      ),
    );
  }
}
