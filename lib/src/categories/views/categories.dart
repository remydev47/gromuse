import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gromuse/const/resource.dart';
import 'package:gromuse/src/categories/widgets/categoriesappbar.dart';
import 'package:gromuse/src/categories/widgets/categorycard.dart';

class CategoryItem {
  final String name;
  final String iconPath;

  CategoryItem({required this.name, required this.iconPath});
}

class Categories extends StatelessWidget {
  Categories({super.key});
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
    return Scaffold(
      appBar: Categoriesappbar(),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          //Proomtion Banner
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFBF6C45),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.local_offer, color: Colors.white),
                    const SizedBox(width: 8.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Get 10% off groceries with Plus+ \n T&C Apply',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Spend \$30.00 to get 5%',
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          //Catories Title
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'All categories',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
             crossAxisCount: 2,
             padding: EdgeInsets.all(16),
             mainAxisSpacing: 16,
             crossAxisSpacing: 16,
             children: [
              CategoryCard(icon: Icons., title: title, subtitle: subtitle, color: color)
             ],
            ),
          )
        ],
      ),
    );
  }
}
