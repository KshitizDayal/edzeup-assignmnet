import 'package:flutter/material.dart';

import '../../utils/teststyle_constants.dart';

class RolesScreen extends StatefulWidget {
  const RolesScreen({super.key});

  @override
  State<RolesScreen> createState() => _RolesScreenState();
}

class _RolesScreenState extends State<RolesScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            "Roles Screen",
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
