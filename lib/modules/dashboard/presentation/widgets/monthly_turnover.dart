import 'package:flutter/material.dart';

class MonthlyTurnoverCard extends StatefulWidget {
  
  const MonthlyTurnoverCard({super.key, });

  @override
  State<MonthlyTurnoverCard> createState() => _MonthlyTurnoverCardState();
}

class _MonthlyTurnoverCardState extends State<MonthlyTurnoverCard> {
  int selectedMonthIndex=4;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
      
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Total Monthly Turnover',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          FittedBox(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '\$2,73,937',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    '+2,937',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Chart placeholder
          SizedBox(
            height: 120,
            width: double.maxFinite,
            child: CustomPaint(
              painter: BarChartPainter(),
              size: const Size(double.infinity, 120),
            ),
          ),
          const SizedBox(height: 12),
          // Month buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(7, (index) {
              const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedMonthIndex=index;
                  });
                },
                child: MonthButton(
                  child: months[index],
                  isSelected: index == selectedMonthIndex,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}


class MonthButton extends StatelessWidget {
  final String child;
  final bool isSelected;
  const MonthButton({super.key,required this.child, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: isSelected?const EdgeInsets.all(3):null,
      decoration:isSelected?  BoxDecoration(

        color: Colors.black,
        borderRadius: BorderRadius.circular(8)

      ):null
      ,
      child: Text(child,style: TextStyle(color: isSelected?Colors.white:Colors.black,
      fontSize: 11
      ),),
    );
  }
}

class BarChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.grey[800]!;
    final highlightPaint = Paint()..color = Colors.grey[600]!;
    
    final values = [0.4, 0.8, 0.3, 0.6, 0.9, 0.5, 0.4];
    final barCount = values.length;
    final totalGapCount = barCount - 1;
    // Choose a reasonable bar width ratio (e.g., bars take 60% of total width)
    final barWidth = size.width * 0.6 / barCount;
    final gapWidth = (size.width - (barWidth * barCount)) / totalGapCount;

    for (int i = 0; i < barCount; i++) {
      final x = i * (barWidth + gapWidth);
      final rect = Rect.fromLTWH(
        x,
        size.height - (values[i] * size.height),
        barWidth,
        values[i] * size.height,
      );
      canvas.drawRRect(
        RRect.fromRectAndRadius(rect, const Radius.circular(4)),
        i == 4 ? highlightPaint : paint, // Highlight May
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
