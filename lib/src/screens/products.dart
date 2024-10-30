import 'package:flutter/material.dart';
import 'package:gromuse/commons/utils/kcolors.dart';
import 'package:gromuse/commons/widgets/app_style.dart';
import 'package:gromuse/src/models/productappbar.dart';
import 'package:gromuse/src/models/productsgrid.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Productappbar(),
      backgroundColor: Kolors.kOffWhite,
      body: Column(
        children: [
         Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for "Grocery"',
                  hintStyle: appStyle(14, Colors.grey, FontWeight.normal),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  suffixIcon: const Icon(Icons.tune, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Productsgrid(),
          ),
        ],
      ),
    );
  }
}