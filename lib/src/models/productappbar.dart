import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gromuse/commons/utils/app_routes.dart';
import 'package:gromuse/commons/utils/kcolors.dart';
import 'package:gromuse/commons/widgets/app_style.dart';

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 40);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class Productappbar extends StatefulWidget implements PreferredSizeWidget {
  const Productappbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(200);

  @override
  State<Productappbar> createState() => _ProductappbarState();
}

class _ProductappbarState extends State<Productappbar> {
  int selectedIndex = 1; // Default to 'Fresh'
  final List<String> categories = [
    'Frozen',
    'Fresh',
    'Drink & Water',
    'Meat',
    'Vegetables',
    'Fruits'
  ];

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 200,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      flexibleSpace: ClipPath(
        clipper: CustomShape(),
        child: Container(
          height: 250,
          width: MediaQuery.of(context).size.width,
          color: const Color(0xFF1D4B4A), // Dark teal color
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 8),
                // Top Bar with back button, title and cart
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Kolors.kOffWhite),
                        child: IconButton(
                          onPressed: () {
                            context.go('/home');
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            size: 24,
                            color: Kolors.kDark,
                          ),
                        ),
                      ),
                      const SizedBox(width: 80),
                      Text(
                        'Daily Foods',
                        style: appStyle(24, Kolors.kOffWhite, FontWeight.bold),
                      ),
                      const SizedBox(width: 30),
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Kolors.kOffWhite),
                        child: IconButton(
                          onPressed: () {
                            context.go('/cart');
                          },
                          icon: Icon(
                            Icons.shopping_cart,
                            size: 20,
                            color: Kolors.kDark,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                // Categories
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 24),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Text(
                            categories[index],
                            style: appStyle(
                              16,
                              selectedIndex == index
                                  ? Colors.green.shade400
                                  : Colors.grey.shade400,
                              FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
