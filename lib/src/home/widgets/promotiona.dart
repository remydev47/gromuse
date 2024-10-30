import 'package:flutter/material.dart';
import 'package:gromuse/commons/utils/kcolors.dart';
import 'package:gromuse/const/resource.dart';

class PromotionSlider extends StatefulWidget {
  const PromotionSlider({Key? key}) : super(key: key);

  @override
  State<PromotionSlider> createState() => _PromotionSliderState();
}

class _PromotionSliderState extends State<PromotionSlider> {
  final PageController _pageController = PageController(viewportFraction: 0.93);
  int _currentPage = 0;

  final List<PromotionBanner> _promotions = [
    PromotionBanner(
      title: 'Up to 30% offer',
      subtitle: 'Enjoy our big offer',
      buttonText: 'Shop Now',
      backgroundColor: Kolors.kPrimary,
      image: R.ASSETS_IMAGES_P1_PNG, // Replace with your image asset
    ),
    PromotionBanner(
      title: 'Get Same day Deliver',
      subtitle: 'On orders above \$20',
      buttonText: 'Shop Now',
      backgroundColor: const Color(0xFFFFEB3B),
      image: R.ASSETS_IMAGES_P2_PNG, // Replace with your image asset
    ),
    PromotionBanner(
      title: 'Up to 25% offer',
      subtitle: 'On first buyers',
      buttonText: 'Shop Now',
      backgroundColor: const Color(0xFF4CAF50),
      image: R.ASSETS_IMAGES_P3_PNG, // Replace with your image asset
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 180,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _promotions.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: _promotions[index],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _promotions.length,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPage == index
                    ? const Color(0xFF4CAF50)
                    : Colors.grey.shade300,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PromotionBanner extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final Color backgroundColor;
  final String image;

  const PromotionBanner({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.backgroundColor,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            bottom: 0,
            top: 0,
            child: Image.asset(
              image,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Add your shop now action here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: backgroundColor == const Color(0xFF4CAF50)
                        ? Colors.white
                        : const Color(0xFF4CAF50),
                    foregroundColor: backgroundColor == const Color(0xFF4CAF50)
                        ? const Color(0xFF4CAF50)
                        : Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(buttonText),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
