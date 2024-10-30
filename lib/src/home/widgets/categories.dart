import 'package:flutter/material.dart';
import 'package:gromuse/const/resource.dart';

class CategoryItem {
  final String name;
  final String iconPath;

  CategoryItem({required this.name, required this.iconPath});
}

class CategoriesSlider extends StatelessWidget {
  CategoriesSlider({Key? key}) : super(key: key);

  final List<CategoryItem> categories = [
    CategoryItem(
      name: 'Fruits',
      iconPath: R.ASSETS_IMAGES_S1_PNG,
    ),
    CategoryItem(
      name: 'Milk & egg',
      iconPath: R.ASSETS_IMAGES_S2_PNG,
    ),
    CategoryItem(
      name: 'Beverages',
      iconPath: R.ASSETS_IMAGES_S3_PNG,
    ),
    CategoryItem(
      name: 'Vaggies',
      iconPath: R.ASSETS_IMAGES_S4_PNG,
    ),
    CategoryItem(
      name: 'Laundry',
      iconPath: R.ASSETS_IMAGES_S5_PNG,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      //margin: const EdgeInsets.symmetric(vertical: 2),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          return CategoryCard(
            category: categories[index],
          );
        },
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final CategoryItem category;

  const CategoryCard({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          // Circular background with icon
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(category.iconPath),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Category name
          Text(
            category.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

// Optional: Shimmer loading effect for categories
class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 14,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }
}
