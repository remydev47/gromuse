// screens/cart_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gromuse/src/controllers/cartprovider.dart';
import 'package:gromuse/src/models/productappbar.dart';
import 'package:provider/provider.dart';
import 'package:gromuse/commons/widgets/app_style.dart';
import 'package:gromuse/commons/utils/kcolors.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go('/products');
          },
          icon: Icon(Icons.arrow_back,color: Kolors.kDark,),
        ),
        title: Text(
          'Shopping Cart',
          style: appStyle(20, Kolors.kDark, FontWeight.bold),
        ),
      ),
      body: Consumer<CartProvider>(
        builder: (context, cart, child) {
          if (cart.items.isEmpty) {
            return Center(
              child: Text(
                'Your cart is empty',
                style: appStyle(16, Colors.grey, FontWeight.normal),
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: cart.items.length,
            itemBuilder: (context, index) {
              final item = cart.items.values.toList()[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          item.image,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style:
                                  appStyle(16, Kolors.kDark, FontWeight.w500),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '\$${item.price}',
                              style:
                                  appStyle(16, Kolors.kDark, FontWeight.bold),
                            ),
                            Text(
                              'Quantity: ${item.quantity}',
                              style:
                                  appStyle(14, Colors.grey, FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
