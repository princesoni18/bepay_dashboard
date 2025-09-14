import 'package:demo_project/modules/dashboard/presentation/widgets/action_button_row.dart';
import 'package:demo_project/modules/dashboard/presentation/widgets/beapay_card.dart';
import 'package:demo_project/modules/dashboard/presentation/widgets/loyalty_program.dart';
import 'package:demo_project/modules/dashboard/presentation/widgets/metrics_card.dart';
import 'package:demo_project/modules/dashboard/presentation/widgets/monthly_turnover.dart';
import 'package:demo_project/modules/dashboard/presentation/widgets/side_bar.dart';
import 'package:demo_project/modules/dashboard/presentation/widgets/wallet_balance.dart';
import 'package:flutter/material.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return  CurvedDashboardSidebar(
      child: Padding(
        padding: const EdgeInsets.only(top: 12,left: 24,right: 24),
        child: SingleChildScrollView(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Column - Main Content
              const Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Bepay Card and Account Info
                    FittedBox(
                      alignment: Alignment.centerLeft,
                      fit: BoxFit.scaleDown,
                      child: Row(
                        children: [
                         BepayCard(),
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
                    ),
                        
                      
                    
                     SizedBox(height: 24),

                    // Account Info
                     Text(
                      'My Account Info',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                     SizedBox(height: 16),
                    
                     WalletBalanceCard(),
                     SizedBox(height: 20),
                    
                     ActionButtonsRow(),
                     SizedBox(height: 24),
                    
                    // Loyalty Program Cards
                     LoyaltyProgramRow(),

                     SizedBox(height: 100,)
                  ],
                ),
              ),
              
              const SizedBox(width: 24),
              
              // Right Column - Analytics
              Expanded(
                flex: 2,
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
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 42.0),
                        child: const ProgressCard(),
                      ),
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