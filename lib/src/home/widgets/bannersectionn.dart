import 'package:flutter/material.dart';

class Bannersection extends StatelessWidget {
  const Bannersection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          _BannerCard(
            title: 'Grocery',
            subtitle: 'By 12:15pm',
            info: 'Free Delivery',
            color: const Color(0xFFFFF3E0),
            imagePath: 'assets/images/b1.png',
          ),
          const SizedBox(width: 12),
          _BannerCard(
            title: 'Wholesale',
            subtitle: 'By 1:30pm',
            info: 'Free delivery',
            color: const Color(0xFFFFE4E8),
            imagePath: 'assets/images/vg6.png',
          ),
        ],
      ),
    );
  }
}

class _BannerCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String info;
  final Color color;
  final String imagePath;

  const _BannerCard({
    required this.title,
    required this.subtitle,
    required this.info,
    required this.color,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const Spacer(),
              Text(
                info,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Positioned(
            right: -10,
            bottom: -10,
            child: Image.asset(
              imagePath,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
