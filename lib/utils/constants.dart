import 'package:edzeup_assignment/utils/user_json.dart';
import 'package:flutter/material.dart';

import '../models/drawer_items.dart';

const double defaultpading = 16.0;

final List<Map<String, dynamic>> sideDrawerListMain = [
  {"iconData": Icons.dashboard, "text": "DashBoard", "isSelected": true},
  {"iconData": Icons.build, "text": "Configuration", "isSelected": false},
  {"iconData": Icons.assignment, "text": "Manage Task", "isSelected": false},
  {
    "iconData": Icons.notifications,
    "text": "Notification",
    "isSelected": false
  },
  {"iconData": Icons.campaign, "text": "Announcement", "isSelected": false},
  {"iconData": Icons.person, "text": "User Report", "isSelected": false},
  {"iconData": Icons.map, "text": "Location Report", "isSelected": false},
];

List<DrawerItems> sideDrawerList =
    sideDrawerListMain.map((e) => DrawerItems.fromJson(e)).toList();

final List<String> dropDownValues = [
  "All Details",
  "Name",
  "Email",
  "Phone Number",
  "Role",
  "Location",
  "Assessment",
];

final List<int> rowsDropDown = [10, 20, 50, users.length];
