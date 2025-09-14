import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BepayCard extends StatelessWidget {
  const BepayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370,
      height: 180,
      
    
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2D2D2D), Color(0xFF1A1A1A)],
        ),
        borderRadius: BorderRadius.circular(16),
      ),

      child: Stack(
        clipBehavior: Clip.hardEdge,
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: SvgPicture.asset("assets/card_bg.svg",fit: BoxFit.cover,))),
          Positioned(
            left: 20,
            top: 20,
            child: Container(
              width: 32,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Icon(
                Icons.credit_card,
                size: 16,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
          right: 0,
          left: 0,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/bepay_logo.svg",height: 44,),
                  const SizedBox(width: 8),
                  const Text(
                    'bepay',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            right: 20,
            bottom: 20,
            child: Text(
              'Premium Card',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
    }
   
   
}