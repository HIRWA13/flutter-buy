import 'package:flutter/material.dart';

import '../widgets/product_card.dart';
import 'login_screen.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  void _logout() {
    // Navigate back to the login screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Flutter Buy",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: _logout,
          )
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.7, // Adjust for card aspect ratio
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          List<Map<String, String>> products = [
            {
              'image': 'assets/images/nike_shoe.png',
              'name': 'Nike shoe',
            },
            {
              'image': 'assets/images/black_t_shirt.jpg',
              'name': 'T-shirt for men',
            },
            {
              'image': 'assets/images/relaxed_pants.jpeg',
              'name': 'Relaxed jeans',
            },
            {
              'image': 'assets/images/accer_laptopp.png',
              'name': 'Slick laptop',
            },
          ];

          return ProductCard(
            imageUrl: products[index]['image']!,
            productName: products[index]['name']!,
          );
        },
      ),
    );
  }
}
