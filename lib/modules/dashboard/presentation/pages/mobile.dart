import 'package:demo_project/modules/dashboard/presentation/widgets/action_button_row.dart';
import 'package:demo_project/modules/dashboard/presentation/widgets/beapay_card.dart';
import 'package:demo_project/modules/dashboard/presentation/widgets/metrics_card.dart';
import 'package:demo_project/modules/dashboard/presentation/widgets/recent_transaction.dart';
import 'package:demo_project/modules/dashboard/presentation/widgets/wallet_balance.dart';
import 'package:flutter/material.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.menu, color: Colors.white),
                ),
                const Text(
                  'Sandbox',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.notifications, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            // Wallet Balance Card
            const WalletBalanceCard(),
            const SizedBox(height: 20),
            
            // Action Buttons
            const ActionButtonsRow(),
            const SizedBox(height: 20),
            
            // Bepay Card
            const BepayCard(),
            const SizedBox(height: 20),
            
            // Recent Transactions
            const RecentTransactionsWidget(),
          ],
        ),
      ),
    );
  }
}