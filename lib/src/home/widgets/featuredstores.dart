import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StoresSection extends StatelessWidget {
  const StoresSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: const [
          StoreCard(
            name: 'Crush grocery',
            deliveryTime: '12',
            backgroundColor: Color(0xFFFF7043),
            logoPath: 'assets/icons/logo1.svg',
          ),
          SizedBox(width: 12),
          StoreCard(
            name: 'Delivery market',
            deliveryTime: '12',
            backgroundColor: Color(0xFF536DFE),
            logoPath: 'assets/icons/logo3.svg',
          ),
          SizedBox(width: 12),
          StoreCard(
            name: 'Quality product',
            deliveryTime: '12',
            backgroundColor: Color(0xFF4CAF50),
            logoPath: 'assets/icons/logo4.svg',
          ),
        ],
      ),
    );
  }
}

class StoreCard extends StatelessWidget {
  final String name;
  final String deliveryTime;
  final Color backgroundColor;
  final String logoPath;

  const StoreCard({
    super.key,
    required this.name,
    required this.deliveryTime,
    required this.backgroundColor,
    required this.logoPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Curved pattern background with logo
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Stack(
              children: [
                // Curved pattern
                Positioned.fill(
                  child: CustomPaint(
                    painter: CurvedPatternPainter(
                      color: Colors.white.withOpacity(0.1),
                    ),
                  ),
                ),
                // Logo
                Positioned(
                  left: 16,
                  bottom: 16,
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 0,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        logoPath,
                        width: 32,
                        height: 32,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.flash_on,
                      color: Color(0xFFFFB74D),
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Delivery In $deliveryTime minute',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF757575),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Custom painter for the curved pattern background
class CurvedPatternPainter extends CustomPainter {
  final Color color;

  CurvedPatternPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final path = Path();

    // Create wavy pattern
    for (var i = -20.0; i < size.width + 20; i += 40) {
      for (var j = -20.0; j < size.height + 20; j += 20) {
        path.moveTo(i, j);
        path.cubicTo(
          i + 10,
          j,
          i + 10,
          j + 10,
          i + 20,
          j + 10,
        );
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
