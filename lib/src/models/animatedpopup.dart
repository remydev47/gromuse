import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gromuse/commons/widgets/app_style.dart';
import 'package:gromuse/src/controllers/cartprovider.dart';
import 'package:gromuse/src/models/productappbar.dart';
import 'package:provider/provider.dart';

class Animatedpopup extends StatelessWidget {
  const Animatedpopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Consumer<CartProvider>(
            builder: (context, cart, child) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: cart.itemCount > 0 ? 70 : 0,
              child: cart.itemCount > 0
                  ? Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 40,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: cart.items.length,
                                  itemBuilder: (context, index) {
                                    final item =
                                        cart.items.values.toList()[index];
                                    return Container(
                                      margin: const EdgeInsets.only(right: 8),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                          item.image,
                                          width: 40,
                                          height: 40,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                context.go(
                                  '/cart'
                                );
                              },
                              child: Row(
                                children: [
                                  Text(
                                    'View Basket',
                                    style: appStyle(
                                      16,
                                      Colors.white,
                                      FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Stack(
                                    children: [
                                      const Icon(
                                        Icons.shopping_cart_outlined,
                                        color: Colors.white,
                                      ),
                                      Positioned(
                                        right: 0,
                                        top: 0,
                                        child: Container(
                                          padding: const EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          constraints: const BoxConstraints(
                                            minWidth: 16,
                                            minHeight: 16,
                                          ),
                                          child: Text(
                                            '${cart.itemCount}',
                                            style: appStyle(
                                              10,
                                              Colors.white,
                                              FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox(),
            ),
          ),
        );
  }
}