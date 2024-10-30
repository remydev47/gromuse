import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gromuse/commons/utils/kcolors.dart';
import 'package:gromuse/commons/widgets/app_style.dart';

class Productdetails extends StatelessWidget {
  final Map<String, dynamic> product;
  const Productdetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kolors.kOffWhite,
      appBar: AppBar(
        backgroundColor: Color(0xFF1B3C35),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Product Details',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart, color: Colors.white),
                onPressed: () {
                  // Handle cart tap
                },
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '2',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                color: Color(0xFF1B3C35),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Stack(
                children: [
                  //white cirved overlay
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: Kolors.kOffWhite,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          )),
                    ),
                  ),
                  //Product Image
                  Center(
                    child: Image.asset(
                      product['image'],
                      height: MediaQuery.of(context).size.height * 0.3,
                      fit: BoxFit.contain,
                    ),
                  ),
                  //Favourite Button
                  Positioned(
                    top: 20,
                    right: 20,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Kolors.kOffWhite,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.favorite_border),
                        onPressed: () {
                          // Handle favorite
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            //Product Description
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product['name'],
                    style: appStyle(24, Kolors.kDark, FontWeight.bold),
                  ),
                  Text(
                    'In ${product['weight']}',
                    style: appStyle(16, Colors.grey, FontWeight.normal),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        '\$${product['price']}',
                        style: appStyle(16, Colors.black, FontWeight.bold),
                      ),
                      const Spacer(),
                      const Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber),
                          Text('4.5 Rating'),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  //featured Icons
                  Row(
                    children: [
                      _buildFeatureIcon(Colors.purple, Icons.eco),
                      _buildFeatureIcon(
                          Colors.orange, Icons.local_fire_department),
                      _buildFeatureIcon(Colors.blue, Icons.restaurant)
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '100% satisfaction guarantee. If you experience any of the following issues, missing, poor item, late arrival, unprofessional service...',
                    style: appStyle(14, Colors.grey, FontWeight.normal),
                  ),
                  Text(
                    'Read More',
                    style: TextStyle(
                      color: Color(0xFF1B3C35),
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Others store',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Handle visit stores
                  },
                  child: const Text(
                    'Visit stores',
                    style: TextStyle(
                      color: Colors.brown,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            _buildStoreItem(
              'Keels Food Market',
              '20.42',
              '12',
              'assets/icons/logo1.svg',
              null,
            ),
            const SizedBox(height: 12),
            _buildStoreItem(
              'Hello Fresh Market',
              '19.50',
              '13',
              'assets/icons/logo2.svg',
              'Lower price',
              deliveryFee: '4.90',
            ),
            const SizedBox(height: 12),
            _buildStoreItem(
              'Growers',
              '23.00',
              '15',
              'assets/icons/logo3.svg',
              'In Store price',
              deliveryFee: '3.90',
            ),
            const SizedBox(height: 12),
            _buildStoreItem(
              'Farm Works market',
              '23.00',
              '15',
              'assets/icons/logo4.svg',
              'In Store price',
              deliveryFee: '3.90',
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.remove),
                  ),
                  Text(
                    '1',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFCEE5D0),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        // Handle add to cart
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_cart,
                            color: Color(0xFF1B3C35),
                          ),
                          SizedBox(width: 6),
                          Text(
                            'Add to cart',
                            style: appStyle(
                                16, const Color(0xFF1B3C35), FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureIcon(Color color, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: color),
    );
  }

  Widget _buildStoreItem(
    String name,
    String price,
    String deliveryTime,
    String logoPath,
    String? badge, {
    String? deliveryFee,
  }) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Store logo
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: SvgPicture.asset(
              logoPath,
              fit:BoxFit.cover
            ),
          ),
          const SizedBox(width: 12),
          // Store details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (badge != null) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.purple.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          badge,
                          style: TextStyle(
                            color: Colors.purple.shade700,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.flash_on,
                      size: 16,
                      color: Colors.amber,
                    ),
                    Text(
                      'Delivery in $deliveryTime minute',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Price and delivery fee
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$$price',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (deliveryFee != null)
                Text(
                  '+\$$deliveryFee Delivery',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
