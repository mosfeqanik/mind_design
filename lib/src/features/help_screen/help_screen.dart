import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../dashboard_screen/provider/dashboard_provider.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  void _onItemTapped() {
    Provider.of<DashboardProvider>(context, listen: false).setSelectedIndex(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: false, // Set to true to allow popping
        onPopInvoked: (didPop) async {
          _onItemTapped();
        },
        child: Center(
            child: Text(
          "Coming soon",
          style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        )),
      ),
    );
  }
}
