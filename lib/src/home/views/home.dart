import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gromuse/commons/utils/kcolors.dart';
import 'package:gromuse/src/home/widgets/bannersectionn.dart';
import 'package:gromuse/src/home/widgets/categories.dart';
import 'package:gromuse/src/home/widgets/featuredstores.dart';
import 'package:gromuse/src/home/widgets/featuredstoresheader.dart';
import 'package:gromuse/src/home/widgets/groceryappbar.dart';
import 'package:gromuse/src/home/widgets/headercategories.dart';
import 'package:gromuse/src/home/widgets/productsection.dart';
import 'package:gromuse/src/home/widgets/promotiona.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GroceryAppBar(),
      backgroundColor: Kolors.kOffWhite,
      body: SafeArea(
        // Wrap the Column with SingleChildScrollView
        child: SingleChildScrollView(
          // Add some padding to avoid content being too close to the edges
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PromotionSlider(),
                const SizedBox(height: 10),
                Headercategories(
                  onViewAllPressed: () {
                    context.go('/categories');
                  },
                ),
                CategoriesSlider(),
                const SizedBox(height: 6),
                ProductSection(),
                SizedBox(height: 16),
                Bannersection(),
                SizedBox(
                  height: 10,
                ),
                Featuredstoresheader(
                  onViewAllPressed: () {
                    context.go('/featuredstores');
                  },
                ),
                StoresSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
