import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gromuse/commons/utils/app_routes.dart';
import 'package:gromuse/commons/utils/kcolors.dart';
import 'package:gromuse/commons/widgets/app_style.dart';
import 'package:gromuse/src/home/widgets/featuredstores.dart';

class Featuredstores extends StatelessWidget {
  const Featuredstores({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go('/home');
          },
          icon: Icon(
            Icons.arrow_back,
            color: Kolors.kDark,
          ),
        ),
        title: Text(
          'Featured Stores',
          style: appStyle(
            18,
            Kolors.kDark,
            FontWeight.bold,
          ),
        ),
      ),
      // Using ListView directly as the body
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          StoreCard(
            name: 'Farm Works',
            deliveryTime: '12 min',
            backgroundColor: Kolors.kGold,
            logoPath: 'assets/icons/logo4.svg',
          ),
          SizedBox(
            height: 6,
          ),
          StoreCard(
            name: 'Hello Fresh',
            deliveryTime: '15 min',
            backgroundColor: Kolors.kSecondaryLight,
            logoPath: 'assets/icons/logo2.svg',
          ),
          SizedBox(
            height: 6,
          ),
          StoreCard(
            name: 'Growers',
            deliveryTime: '10 min',
            backgroundColor: Kolors.kPrimary,
            logoPath: 'assets/icons/logo3.svg',
          ),
          SizedBox(
            height: 6,
          ),
          StoreCard(
            name: 'Sob',
            deliveryTime: '20 min',
            backgroundColor: Kolors.kSecondaryLight,
            logoPath: 'assets/icons/logo5.svg',
          ),
          SizedBox(
            height: 6,
          ),
          StoreCard(
            name: 'Growser',
            deliveryTime: '30 min',
            backgroundColor: Kolors.kPrimary,
            logoPath: 'assets/icons/logo6.svg',
          ),
        ],
      ),
    );
  }
}
