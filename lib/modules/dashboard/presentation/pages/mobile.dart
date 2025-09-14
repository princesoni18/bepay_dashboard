import 'package:demo_project/core/shared/widgets/custom_switch.dart';
import 'package:demo_project/modules/dashboard/presentation/widgets/action_button_row.dart';
import 'package:demo_project/modules/dashboard/presentation/widgets/beapay_card.dart';
import 'package:demo_project/modules/dashboard/presentation/widgets/metrics_card.dart';
import 'package:demo_project/modules/dashboard/presentation/widgets/recent_transaction.dart';
import 'package:demo_project/modules/dashboard/presentation/widgets/wallet_balance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24),
        


        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:const  BorderRadius.only(bottomLeft: Radius.circular(16),bottomRight: Radius.circular(16)),
                boxShadow: [BoxShadow(
                  color: Colors.grey.shade200,
                  offset: const Offset(2,2)
                )]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: SvgPicture.asset("assets/menu.svg"),
                  ),
                  
                  Row(
                    children: [
                      const Text(
                    'Sandbox',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 16,),
                  CustomSwitch(value: true, onChanged: (value) {},),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(Icons.notifications, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
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