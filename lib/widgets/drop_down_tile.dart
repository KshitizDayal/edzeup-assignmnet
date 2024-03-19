import 'package:flutter/material.dart';

class DropDownTile extends StatelessWidget {
  final Color bgcolor;
  final double width;
  final String? value;
  final Function(String?)? onChanged;
  final List<DropdownMenuItem<String>>? items;
  final double maxHeight;
  final String hintText;
  const DropDownTile(
      {super.key,
      required this.bgcolor,
      required this.width,
      required this.value,
      required this.onChanged,
      required this.items,
      required this.maxHeight,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: bgcolor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      margin: const EdgeInsets.symmetric(horizontal: 12),
      width: width,
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          elevation: 4,
          isExpanded: true,
          value: value,
          onChanged: onChanged,
          items: items,
          menuMaxHeight: maxHeight,
          hint: Text(hintText),
        ),
      ),
    );
  }
}

class DropDownTileInt extends StatelessWidget {
  final Color bgcolor;
  final double width;
  final int? value;
  final Function(int?)? onChanged;
  final List<DropdownMenuItem<int>>? items;
  final double maxHeight;
  final String hintText;
  const DropDownTileInt(
      {super.key,
      required this.bgcolor,
      required this.width,
      required this.value,
      required this.onChanged,
      required this.items,
      required this.maxHeight,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: bgcolor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      margin: const EdgeInsets.symmetric(horizontal: 12),
      width: width,
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          elevation: 4,
          isExpanded: true,
          value: value,
          onChanged: onChanged,
          items: items,
          menuMaxHeight: maxHeight,
          hint: Text(hintText),
        ),
      ),
    );
  }
}
