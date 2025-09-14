import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardSidebar extends StatefulWidget {
  final Widget child;
  final int selectedIndex;
  final Function(int)? onItemSelected;

  const DashboardSidebar({
    super.key,
    required this.child,
    this.selectedIndex = 0,
    this.onItemSelected,
  });

  @override
  State<DashboardSidebar> createState() => _DashboardSidebarState();
}

class _DashboardSidebarState extends State<DashboardSidebar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  final List<SidebarItem> _menuItems = [
  
    SidebarItem(
      icon: Icons.account_balance_wallet,
      label: 'Wallet',
    ),
    SidebarItem(
      icon: Icons.swap_horiz,
      label: 'Transactions',
    ),
    SidebarItem(
      icon: Icons.bar_chart,
      label: 'Analytics',
    ),
    SidebarItem(
      icon: Icons.credit_card,
      label: 'Cards',
    ),
    SidebarItem(
      icon: Icons.settings,
      label: 'Settings',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading:  SvgPicture.asset("assets/bepay_logo.svg",height: 24,),
        backgroundColor: Colors.black,
        elevation: 0.0,
        surfaceTintColor: Colors.transparent,
        title: const Text("Dashboard",style: TextStyle(color: Colors.white),),
      ),
      body: Row(
        children: [
          // Sidebar
          Container(
            width: 80,
            height: MediaQuery.of(context).size.height,
            color: Colors.black,
            child: Column(
              children: [
                const SizedBox(height: 20),
                
                // Logo/Brand Section
               
                
                // Menu Items
                Expanded(
                  child: Column(
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
                          width: 60,
                          height: 60,
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          decoration: BoxDecoration(
                            color: isSelected 
                                ? Colors.white.withOpacity(0.1)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                item.icon,
                                color: isSelected ? Colors.white : Colors.grey[600],
                                size: 24,
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
                  margin: const EdgeInsets.only(bottom: 20),
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
          
          // Main Content
          Expanded(
            child: widget.child,
          ),
        ],
      ),
    );
  }
}

class SidebarItem {
  final IconData icon;
  final String label;
  final bool isSelected;

  SidebarItem({
    required this.icon,
    required this.label,
    this.isSelected = false,
  });
}

// Example usage widget
class DashboardWithSidebar extends StatelessWidget {
  const DashboardWithSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardSidebar(
      selectedIndex: 0,
      onItemSelected: (index) {
        print('Selected menu item: $index');
      },
      child: Container(
        color: const Color(0xFFF8F9FA),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Main Dashboard Content',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'This is where your main content goes.\nThe sidebar will wrap around any widget you pass as child.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
