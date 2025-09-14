import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WalletBalanceCard extends StatelessWidget {
  const WalletBalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
      
     
        borderRadius: BorderRadius.circular(16),
       
      ),
      child: 
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Arshi\'s Wallets balance',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 12,
                    height: 12,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.visibility, size: 16, color: Colors.grey),
                ],
              ),
              const SizedBox(height: 12),
              const Text(
                '\$6,53,877.09',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: 150,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6)  ,
                decoration
                : BoxDecoration(
          
                  color: Colors.grey[200],
          
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Today',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                       
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        '+\$2.56',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
       
    );
  }
}