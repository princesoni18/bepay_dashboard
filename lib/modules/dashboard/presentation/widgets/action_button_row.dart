import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ActionButtonsRow extends StatelessWidget {
  const ActionButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 600;
        
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           isMobile ?const ActionButtonMobile(icon: "send", label: 'send'):  ActionButton(
              icon: "send",
              label: 'Send',
              isCompact: isMobile,
            ),

            isMobile ? const SizedBox(width: 12) : const SizedBox(width: 24),
           isMobile ?const ActionButtonMobile(icon: "recieve", label: 'recieve'):  ActionButton(
              icon: "recieve",
              label: 'Receive',
              isCompact: isMobile,
            ),
            isMobile ? const SizedBox(width: 12) : const SizedBox(width: 24),
           isMobile ?const ActionButtonMobile(icon: "pay", label: 'pay'):  ActionButton(

              icon: "pay",
              label: isMobile ? 'Pay Link' : 'Pay Link',
              isCompact: isMobile,
            ),
            isMobile ? const SizedBox(width: 12) : const SizedBox(width: 24),
           isMobile ?const ActionButtonMobile(icon: "casj", label: 'Cash Out'): ActionButton(
              icon: "casj",
              label: isMobile ? 'Cash Out' : 'Swap',
              isCompact: isMobile,
            ),
          ],
        );
      },
    );
  }
}

class ActionButtonMobile extends StatelessWidget {
  final String icon;
  final String label;
  final bool isCompact;

  const ActionButtonMobile({
    super.key,
    required this.icon,
    required this.label,
    this.isCompact = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [

        Container(
      padding: EdgeInsets.symmetric(
        horizontal: isCompact ? 8 : 20,
        vertical: isCompact ? 6 : 8,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12)
      ),
      child:
          Container(
          
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: SvgPicture.asset (
              "assets/$icon.svg",
              height: isCompact ? 20 : 35,
            
            ),
          ),),


          const SizedBox(height: 12),

     Text(
            label,
            style: TextStyle(
              fontSize: isCompact ? 12 : 14,
              fontWeight: FontWeight.w500,
            ),
          ),

    
    ]);
  }
}

class ActionButton extends StatelessWidget {
  final String icon;
  final String label;
  final bool isCompact;

  const ActionButton({
    super.key,
    required this.icon,
    required this.label,
    this.isCompact = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isCompact ? 8 : 20,
        vertical: isCompact ? 6 : 8,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isCompact ? 12 : 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 12),
          Container(
          
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: SvgPicture.asset (
              "assets/$icon.svg",
              height: isCompact ? 20 : 35,
            
            ),
          ),
          
          
        ],
      ),
    );
  }
}

