import 'package:demo_project/modules/dashboard/presentation/widgets/action_button_row.dart';
import 'package:demo_project/modules/dashboard/presentation/widgets/beapay_card.dart';
import 'package:demo_project/modules/dashboard/presentation/widgets/metrics_card.dart';
import 'package:demo_project/modules/dashboard/presentation/widgets/side_bar.dart';
import 'package:demo_project/modules/dashboard/presentation/widgets/wallet_balance.dart';
import 'package:flutter/material.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return  DashboardSidebar(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Column - Main Content
              const Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Bepay Card and Account Info
                    Row(
                      children: [
                         Expanded(child: BepayCard()),
                        const SizedBox(width: 20),
                        
                              const MetricCard(
                                title: 'Payouts',
                                subtitle: 'Current Payouts',
                                value: '\$3,877.10',
                                icon: "payout",
                              ),
                              const SizedBox(width: 24),
                              const MetricCard(
                                title: 'Turnover',
                                subtitle: 'Current Payouts',
                                value: '\$3,877.10',
                                icon: "turnover",
                              ),
                            ],
                          ),
                        
                      
                    
                    const SizedBox(height: 24),
                    
                    // Account Info
                    const Text(
                      'My Account Info',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    const WalletBalanceCard(),
                    const SizedBox(height: 20),
                    
                    const ActionButtonsRow(),
                    const SizedBox(height: 24),
                    
                    // Loyalty Program Cards
                    const LoyaltyProgramRow(),
                  ],
                ),
              ),
              
              const SizedBox(width: 24),
              
              // Right Column - Analytics
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 40),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
      
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: const Column(
                    children: [
                      const MonthlyTurnoverCard(),
                      const SizedBox(height: 20),
                      const ProgressCard(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}