import 'package:flutter/material.dart';

import '../utils/color_constants.dart';
import '../utils/teststyle_constants.dart';

class DrawerListTile extends StatelessWidget {
  final IconData iconData;
  final String text;
  final int index;
  final bool isSelected;
  final VoidCallback onTap;

  const DrawerListTile(
      {super.key,
      required this.iconData,
      required this.text,
      required this.index,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: isSelected ? blackColor : blackColor.withOpacity(0.6),
        size: isSelected ? 26 : 20,
      ),
      title: Text(
        text,
        style: textStyle.copyWith(
          color: isSelected ? blackColor : blackColor.withOpacity(0.6),
          fontSize: isSelected ? 16 : 14,
        ),
      ),
      onTap: onTap,
    );
  }
}
