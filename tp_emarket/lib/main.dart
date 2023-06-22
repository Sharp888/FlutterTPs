import 'package:flutter/material.dart';
import 'package:tp_emarket/services/product.dart';
import 'package:tp_emarket/widgets/product_display.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'services/product.dart';
// import 'widgets/styledtextframe.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ProductService _productService = ProductService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Product>>(
          future: _productService.getProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                  child: Text('snapshot.hasError Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              final productList =
                  snapshot.data!; // Extract the list of products from
              return ListView.builder(
                  itemCount: productList.length,
                  itemBuilder: (context, index) {
                    final singleProduct = productList[index];

                    // Return a widget to display each product
                    return ProductDetailsCard(product: singleProduct);
                  });
            } else {
              return const Center(child: Text('No products found.'));
            }
          }),
    );
  }
}
