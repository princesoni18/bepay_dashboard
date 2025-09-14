import 'package:demo_project/modules/dashboard/presentation/pages/desktop.dart';
import 'package:demo_project/modules/dashboard/presentation/pages/mobile.dart';
import 'package:flutter/material.dart';

class BepayDashboard extends StatelessWidget {
  const BepayDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: LayoutBuilder(
        builder: (context, constraints) {
       
          bool isMobile = constraints.maxWidth < 790;
          
          if (isMobile) {
            return const MobileLayout();
          } else {
            return const DesktopLayout();
          }
        },
      ),
    );
  }
}
