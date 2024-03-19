import 'package:flutter/material.dart';

class DrawerItems {
  IconData? iconData;
  String? text;
  bool? isSelected;

  DrawerItems({this.iconData, this.text, this.isSelected});

  DrawerItems.fromJson(Map<String, dynamic> json) {
    iconData = json['iconData'];
    text = json['text'];
    isSelected = json['isSelected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['iconData'] = iconData;
    data['text'] = text;
    data['isSelected'] = isSelected;
    return data;
  }
}
