import 'package:demo_project/core/constants/colors.dart';
import 'package:demo_project/modules/dashboard/presentation/widgets/loyalty_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class MetricCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String value;
  final String icon;

  const MetricCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
    
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/$icon.svg", height: 48),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}


class ProgressCard extends StatelessWidget {
  const ProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
         
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF2D2D2D), Color(0xFF1A1A1A)],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Column(
                    children: [
                      const Text(
                        'Plan for May',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Completed',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    
                    ],
                  ),
                    const SizedBox(width: 40),
                      SizedBox(
                        width: 90,
                        height: 90,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                              SvgPicture.asset("assets/loading.svg"),
                              const Text("72%",style: TextStyle(color: Colors.white),)
          
                          ],
                        
                        ),
                      ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



