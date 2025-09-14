import 'package:demo_project/modules/dashboard/presentation/widgets/loyalty_card.dart';
import 'package:flutter/material.dart';

class LoyaltyProgramRow extends StatelessWidget {
  const LoyaltyProgramRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Loyalty Programs',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: LoyaltyCard(
                color: Colors.purple,
                title: 'Coming Soon',
                subtitle: 'For merchants',
                icon: Icons.loyalty,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: LoyaltyCard(
                color: Colors.blue,
                title: 'Coming Soon',
                subtitle: 'For merchants',
                icon: Icons.card_giftcard,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: LoyaltyCard(
                color: Colors.red,
                title: 'Coming Soon',
                subtitle: 'For merchants',
                icon: Icons.redeem,
              ),
            ),
          ],
        ),
      ],
    );
  }
}