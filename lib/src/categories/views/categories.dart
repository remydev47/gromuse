import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go('/home');
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Text('Categories'),
      ),
    );
  }
}
