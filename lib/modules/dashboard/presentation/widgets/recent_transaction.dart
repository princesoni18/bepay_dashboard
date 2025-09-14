import 'package:flutter/material.dart';

class RecentTransactionsWidget extends StatelessWidget {
  const RecentTransactionsWidget({super.key});

  final List<TransactionItem> transactions = const [
    TransactionItem(
      name: 'BTC',
      price: '\$104,075',
      change: '+1.09%',
      balance: '0',
      balanceValue: '0',
      color: Color(0xFFF7931A),
      icon: '₿',
      isPositive: true,
    ),
    TransactionItem(
      name: 'TRON',
      price: '\$0.26',
      change: '+1.09%',
      balance: '0.25',
      balanceValue: '\$1190',
      color: Color(0xFFE51A31),
      icon: 'T',
      isPositive: true,
    ),
    TransactionItem(
      name: 'USDT (ERC 20)',
      price: '\$0.9994',
      change: '+1.09%',
      balance: '0',
      balanceValue: '0',
      color: Color(0xFF26A17B),
      icon: '₮',
      isPositive: true,
    ),
    TransactionItem(
      name: 'Etherium',
      price: '\$2,340',
      change: '-3.09%',
      balance: '0',
      balanceValue: '0',
      color: Color(0xFF627EEA),
      icon: 'Ξ',
      isPositive: false,
    ),
    TransactionItem(
      name: 'TON',
      price: '\$1.185',
      change: '+1.09%',
      balance: '0.25',
      balanceValue: '\$1190',
      color: Color(0xFF0088CC),
      icon: '💎',
      isPositive: true,
    ),
    TransactionItem(
      name: 'XRP',
      price: '\$2.43',
      change: '+1.09%',
      balance: '0.25',
      balanceValue: '\$1190',
      color: Color(0xFF000000),
      icon: 'X',
      isPositive: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recent Transactions',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'See more',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Transaction List
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: transactions.length,
            separatorBuilder: (context, index) => Divider(
              height: 1,
              color: Colors.grey[100],
              indent: 70,
            ),
            itemBuilder: (context, index) {
              return TransactionTile(transaction: transactions[index]);
            },
          ),
        ],
      ),
    );
  }
}

class TransactionTile extends StatelessWidget {
  final TransactionItem transaction;

  const TransactionTile({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          // Crypto Icon
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: transaction.color,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: transaction.name == 'TON' 
                ? const Text('💎', style: TextStyle(fontSize: 18))
                : Text(
                    transaction.icon,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            ),
          ),
          
          const SizedBox(width: 12),
          
          // Name and Price
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Text(
                      transaction.price,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: transaction.isPositive 
                            ? Colors.green.withOpacity(0.1)
                            : Colors.red.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        transaction.change,
                        style: TextStyle(
                          fontSize: 12,
                          color: transaction.isPositive ? Colors.green : Colors.red,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Balance
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                transaction.balance,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                transaction.balanceValue,
                style: TextStyle(
                  fontSize: 14,
                  color: transaction.balanceValue == '0' 
                      ? Colors.grey 
                      : const Color(0xFF00C853),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TransactionItem {
  final String name;
  final String price;
  final String change;
  final String balance;
  final String balanceValue;
  final Color color;
  final String icon;
  final bool isPositive;

  const TransactionItem({
    required this.name,
    required this.price,
    required this.change,
    required this.balance,
    required this.balanceValue,
    required this.color,
    required this.icon,
    required this.isPositive,
  });
}