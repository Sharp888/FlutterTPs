import 'package:flutter/material.dart';

import '../services/product.dart';

class ProductDetailsCard extends StatelessWidget {
  final Product product;

  const ProductDetailsCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product.thumbnail),
            const SizedBox(height: 16.0),
            const Text(
              'Description:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(product.description),
            const SizedBox(height: 16.0),
            const Text(
              'Price:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text('\$${product.price.toStringAsFixed(2)}'),
            const SizedBox(height: 16.0),
            const Text(
              'Discount Percentage:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text('${product.discountPercentage.toStringAsFixed(2)}%'),
            const SizedBox(height: 16.0),
            const Text(
              'Rating:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(product.rating.toString()),
            const SizedBox(height: 16.0),
            const Text(
              'Stock:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(product.stock.toString()),
            const SizedBox(height: 16.0),
            const Text(
              'Brand:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(product.brand),
            const SizedBox(height: 16.0),
            const Text(
              'Category:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(product.category),
          ],
        ),
      ),
    );
  }
}
