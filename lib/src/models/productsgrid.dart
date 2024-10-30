import 'package:flutter/material.dart';
import 'package:gromuse/commons/utils/kcolors.dart';
import 'package:gromuse/commons/widgets/app_style.dart';
import 'package:gromuse/src/controllers/cartprovider.dart';
import 'package:gromuse/src/models/animatedpopup.dart';
import 'package:gromuse/src/screens/productdetail.dart';
import 'package:provider/provider.dart';

class Productsgrid extends StatelessWidget {
  Productsgrid({super.key});
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Pepper',
      'subtitle': 'Local shop',
      'weight': '500 gm',
      'price': '14.29',
      'image': 'assets/images/vg1.png', // Replace with your image path
    },
    {
      'name': 'Red Cabbage',
      'subtitle': 'Local shop',
      'weight': '450 gm',
      'price': '14.29',
      'image': 'assets/images/n4.png',
    },
    {
      'name': 'Beef Mixed',
      'subtitle': 'Cut Bone',
      'weight': '1000 gm',
      'price': '14.29',
      'image': 'assets/images/b1.png',
    },
    {
      'name': 'Chicken',
      'subtitle': 'Frozen pack',
      'weight': '250 gm',
      'price': '14.29',
      'image': 'assets/images/n2.png',
    },
    {
      'name': 'Salmon',
      'subtitle': 'Frozen pack',
      'weight': '250 gm',
      'price': '14.29',
      'image': 'assets/images/n3.png',
    },
    {
      'name': 'PineApple',
      'subtitle': 'Process food',
      'weight': '1 kg',
      'price': '14.29',
      'image': 'assets/images/n5.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Productdetails(product: product),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Kolors.kGrayLight,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                          ),
                          child: Image.asset(
                            product['image'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product['name'],
                              style:
                                  appStyle(16, Kolors.kDark, FontWeight.w500),
                            ),
                            SizedBox(height: 4),
                            Text(
                              product['subtitle'],
                              style:
                                  appStyle(14, Colors.grey, FontWeight.normal),
                            ),
                            Text(
                              product['weight'],
                              style:
                                  appStyle(14, Colors.grey, FontWeight.normal),
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$${product['price']}',
                                  style: appStyle(
                                      16, Kolors.kDark, FontWeight.bold),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade50,
                                    shape: BoxShape.circle,
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      context.read<CartProvider>()
                                          .addItem(product);
                                      ScaffoldMessenger.of(context)
                                          .clearSnackBars();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              'Added ${product['name']} to cart'),
                                          duration: const Duration(seconds: 1),
                                        ),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: Kolors.kDark,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Animatedpopup()
      ],
    );
  }
}
