// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_mobile/helper/constants.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool obsecureText;
  final void Function(String)? onChange;
  final void Function(String)? onSubmited;
  final Function? validator;
  final IconData sufficIcon;
  final bool autocorrect;
  final TextInputType keyboardType;
  final bool readOnly;
  final void Function()? onTap;
  final Widget? label;

  const CustomTextField({
    super.key,
    this.onTap,
    this.hintText = "Hint",
    this.obsecureText = false,
    this.controller,
    this.onChange,
    this.onSubmited,
    this.validator,
    this.autocorrect = false,
    this.sufficIcon = Icons.abc,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.label,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: widget.onTap,
      enableSuggestions: false,
      controller: widget.controller,
      onChanged: widget.onChange,
      onSubmitted: widget.onSubmited,
      autocorrect: widget.autocorrect,
      textAlignVertical: TextAlignVertical.center,
      keyboardType: widget.keyboardType,
      readOnly: widget.readOnly,
      style: TextStyle(
        decoration: TextDecoration.none,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Constants.radius1),
        ),
        label: widget.label,
        isDense: true,
        contentPadding: EdgeInsets.only(
          top: 18,
          right: 10,
          left: 15,
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        suffixIcon:
            widget.sufficIcon == Icons.abc ? null : Icon(widget.sufficIcon),
      ),
      obscureText: widget.obsecureText,
    );
  }
}
