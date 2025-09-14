import 'package:demo_project/core/constants/colors.dart';
import 'package:demo_project/core/shared/widgets/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CurvedDashboardSidebar extends StatefulWidget {
  final Widget child;
  final int selectedIndex;
  final Function(int)? onItemSelected;

  const CurvedDashboardSidebar({
    super.key,
    required this.child,
    this.selectedIndex = 0,
    this.onItemSelected,
  });

  @override
  State<CurvedDashboardSidebar> createState() => _CurvedDashboardSidebarState();
}

class _CurvedDashboardSidebarState extends State<CurvedDashboardSidebar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  final List<SidebarItem> _menuItems = [
    SidebarItem(
      icon: "home",
      label: 'Home',
    ),
    SidebarItem(
      icon: "wallet",
      label: 'Payment History',
    ),
    SidebarItem(
      icon: "wallet",
      label: 'payment_link',
    ),
    SidebarItem(
      icon: "settings",
      label: 'settings',
    ),
   
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Row(
        children: [
          // Custom Curved Sidebar with integrated AppBar
          Container(
            width: 80,
            height: MediaQuery.of(context).size.height,
            child:  Container(
                width: 80,
                color: Colors.black,
                child: Column(
                  children: [
                    // Top section with logo (AppBar area)
                    Container(
                   
                      padding: const EdgeInsets.only(top: 40),
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/bepay_logo.svg",
                          height: 28,
                        
                        ),
                      ),
                    ),
                  const Text("Bepay buisness",style: TextStyle(color: cardColor,fontSize: 8),),
                
                    const SizedBox(height: 20),
                    
                    // Menu Items
                    Expanded(
                    
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _menuItems.asMap().entries.map((entry) {
                          int index = entry.key;
                          SidebarItem item = entry.value;
                          bool isSelected = index == _selectedIndex;
                          
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedIndex = index;
                              });
                              widget.onItemSelected?.call(index);
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              decoration: BoxDecoration(
                                color: isSelected 
                                    ? Colors.white.withOpacity(0.15)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/${item.icon}.svg",
                                    color: isSelected ? Colors.white : Colors.grey[400],
                                    height: 22,
                                  ),
                                  if (isSelected)
                                    Container(
                                      width: 4,
                                      height: 4,
                                      margin: const EdgeInsets.only(top: 4),
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    
                    // Bottom Section - User Profile
                    Container(
                      width: 40,
                      height: 40,
                      margin: const EdgeInsets.only(bottom: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.orange,
                          width: 2,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Container(
                          color: Colors.orange,
                          child: const Center(
                            child: Text(
                              'A',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          
          
          // Main Content with Custom AppBar
          Expanded(
            child: Column(
              children: [
                // Custom AppBar
                Container(
                  height: 80,
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  decoration: const BoxDecoration(
                   color: Colors.black
                  ),
                  child: Row(
                    children: [
                      const Text(
                        "Dashboard",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 40),
                      Expanded(
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                         
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: borderColor,
                              width: 1,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search for anything',
                              hintStyle: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 14,
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey[500],
                                size: 20,
                              ),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 4
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      // Sandbox toggle
                      Row(
                        children: [
                          const Text(
                            'Sandbox',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: 8),
                          CustomSwitch(
                            value: true,
                            onChanged: (value) {},
                         
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                      // Notification icon
                       SvgPicture.asset("assets/notification.svg",height: 24,),
                      
                      const SizedBox(width: 12),
                      // Withdraw button
                      Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.grey[300]!,
                            width: 1,
                          ),
                        ),
                        child:  Row(
                          children: [
                            SvgPicture.asset(
                              "assets/withdraw.svg",
                              height: 16,
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              'Withdraw',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600
                               
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Main Content
                 Expanded(
                    child: widget.child,
                  ),
                
              ],
            ),
          ),
          Container(width: 18,decoration:const  BoxDecoration(color: Colors.black),)
        ],
      ),
    );
  }
}

class CurvedSidebarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final path = Path();
    
    // Start from top-left
    path.moveTo(0, 0);
    
    // Draw to top-right minus curve
    path.lineTo(size.width - 20, 0);
    
    // Create curved top-right corner
    path.quadraticBezierTo(
      size.width, 0,
      size.width, 20,
    );
    
    // Draw down the right side with slight inward curve
    path.quadraticBezierTo(
      size.width + 15, size.height * 0.3,
      size.width + 10, size.height * 0.5,
    );
    
    path.quadraticBezierTo(
      size.width + 15, size.height * 0.7,
      size.width, size.height - 20,
    );
    
    // Create curved bottom-right corner
    path.quadraticBezierTo(
      size.width, size.height,
      size.width - 20, size.height,
    );
    
    // Draw to bottom-left
    path.lineTo(0, size.height);
    
    // Close the path
    path.close();
    
    canvas.drawPath(path, paint);
    
    // Add shadow effect
    final shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.1)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);
      
    canvas.drawPath(path, shadowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class SidebarItem {
  final String  icon;
  final String label;
  final bool isSelected;

  SidebarItem({
    required this.icon,
    required this.label,
    this.isSelected = false,
  });
}
