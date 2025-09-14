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
        color: Colors.grey[200],
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

class MonthlyTurnoverCard extends StatelessWidget {
  const MonthlyTurnoverCard({super.key});

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Total Monthly Turnover',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          FittedBox(
            child: Row(
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
            child: CustomPaint(
              painter: BarChartPainter(),
              size: const Size(double.infinity, 120),
            ),
          ),
          const SizedBox(height: 12),
          // Month labels
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Jan', style: TextStyle(fontSize: 12, color: Colors.grey)),
              Text('Feb', style: TextStyle(fontSize: 12, color: Colors.grey)),
              Text('Mar', style: TextStyle(fontSize: 12, color: Colors.grey)),
              Text('Apr', style: TextStyle(fontSize: 12, color: Colors.grey)),
              Text('May', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              Text('Jun', style: TextStyle(fontSize: 12, color: Colors.grey)),
              Text('Jul', style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}

class BarChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.grey[800]!;
    final highlightPaint = Paint()..color = Colors.grey[600]!;
    
    final barWidth = size.width / 10;
    final values = [0.4, 0.8, 0.3, 0.6, 0.9, 0.5, 0.4];
    
    for (int i = 0; i < values.length; i++) {
      final rect = Rect.fromLTWH(
        i * (barWidth + 4) + barWidth / 4,
        size.height - (values[i] * size.height),
        barWidth / 2,
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

class ProgressCard extends StatelessWidget {
  const ProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            Column(
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
              const SizedBox(height: 40),
                SizedBox(
                  width: 90,
                  height: 90,
                  child: CustomPaint(
                    painter: CircularProgressPainter(progress: 0.72),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}

class CircularProgressPainter extends CustomPainter {
  final double progress;

  CircularProgressPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 10;

    // Background circle
    final backgroundPaint = Paint()
      ..color = Colors.white.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    canvas.drawCircle(center, radius, backgroundPaint);

    // Progress arc
    final progressPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -3.14159 / 2, // Start at top
      2 * 3.14159 * progress, // Progress angle
      false,
      progressPaint,
    );

    // Text
    final textPainter = TextPainter(
      text: TextSpan(
        text: '${(progress * 100).round()}%',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(
        center.dx - textPainter.width / 2,
        center.dy - textPainter.height / 2,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class LoyaltyProgramRow extends StatelessWidget {
  const LoyaltyProgramRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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