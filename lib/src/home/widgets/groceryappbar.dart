import 'package:flutter/material.dart';

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

class GroceryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GroceryAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(200);

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
                // Search Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 12),
                        const Icon(Icons.search, color: Colors.grey),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search for "Grocery"',
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.grey[400]),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[100],
                          ),
                          child: const IconButton(
                            icon: Icon(Icons.shopping_cart_outlined),
                            onPressed: null,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Location Text
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Column(
                    children: [
                      Text(
                        'Current Location',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'California, USA',
                            style: TextStyle(
                              color: Color(0xFFB8E5B5),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 12,
                            color: Color(0xFFB8E5B5),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Category Icons
              ],
            ),
          ),
        ),
      ),
    );
  }

}
