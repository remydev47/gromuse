// ignore_for_file: unused_element
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gromuse/src/categories/views/categories.dart';
import 'package:gromuse/src/entrypoint/entrypoint.dart';
import 'package:gromuse/src/onboarding/views/onboarding.dart';
import 'package:gromuse/src/screens/cart.dart';
import 'package:gromuse/src/screens/featuredstorescreen.dart';
import 'package:gromuse/src/screens/products.dart';
import 'package:gromuse/src/splashscreen/splashscreen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter _router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Splashscreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => Entrypoint(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnBoardingScreen(),
    ),
    GoRoute(
      path: '/categories',
      builder: (context, state) => const Categories(),
    ),
    GoRoute(
      path: '/featuredstores',
      builder: (context, state) => const Featuredstores(),
    ),
    GoRoute(
      path: '/products',
      builder: (context, state) => const Products(),
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) => const CartScreen(),
    ),

    // GoRoute(
    //   path: '/orderconfirmation',
    //   builder: (context, state) => const Orderconfirmation(),
    // ),
    // GoRoute(
    //   path: '/cart',
    //   builder: (context, state) => CartPage(),
    // ),
    // GoRoute(
    //   path: '/productspage',
    //   builder: (BuildContext context, GoRouterState state) => ProductsPage(),
    // ),
    // // GoRoute(
    // //   path: '/help',
    // //   builder: (context, state) => const HelpCenterPage(),
    // // ),
    // // GoRoute(
    // //   path: '/orders',
    // //   builder: (context, state) => const OrdersPage(),
    // // ),
    // GoRoute(
    //   path: '/login',
    //   builder: (context, state) => const LoginScreen(),
    //),
    // GoRoute(
    //   path: '/register',
    //   builder: (context, state) => const RegistrationPage(),
    // ),
    // GoRoute(
    //   path: '/categories',
    //   builder: (context, state) => const CategoriesPage(),
    // ),
    //  GoRoute(
    //   path: '/category',
    //   builder: (context, state) => const CategoryPage(),
    // ),

    // GoRoute(
    //   path: '/addaddress',
    //   builder: (context, state) => const AddAddress(),
    // ),

    // GoRoute(
    //   path: '/addresses',
    //   builder: (context, state) => const AddressesListPage(),
    // ),

    //  GoRoute(
    //   path: '/notifications',
    //   builder: (context, state) => const NotificationPage(),
    // ),

    //  GoRoute(
    //   path: '/tracking',
    //   builder: (context, state) => const TrackOrderPage(),
    // ),

    // GoRoute(
    //   path: '/checkout',
    //   builder: (context, state) => const CheckoutPage(),
    // ),

    //   GoRoute(
    //   path: '/successful',
    //   builder: (context, state) => const SuccessfulPayment(),
    // ),

    //   GoRoute(
    //   path: '/failed',
    //   builder: (context, state) => const FailedPayment(),
    // ),

    // GoRoute(
    //   path: '/product/:id',
    //   builder: (BuildContext context, GoRouterState state) {
    //     final productId = state.pathParameters['id'];
    //     return ProductsPage(productId: productId.toString());
    //   },
    // ),
  ],
);

GoRouter get router => _router;
