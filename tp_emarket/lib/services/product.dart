import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      discountPercentage: json['discountPercentage'].toDouble(),
      rating: json['rating'].toDouble(),
      stock: json['stock'],
      brand: json['brand'],
      category: json['category'],
      thumbnail: json['thumbnail'],
      images: List<String>.from(json['images']),
    );
  }
}

class ProductService {
  final String apiUrl = 'https://dummyjson.com/products';

  Future<List<Product>> getProducts() async {
    Response response = await Dio().get(apiUrl);

    List<dynamic> returned = jsonDecode(response.data);
    List<Product> toReturn = [];

    for (var data in returned) {
      toReturn.add(Product.fromJson(data));
    }

    return toReturn;

    //   final response = await http.get(Uri.parse(apiUrl));

    //   if (response.statusCode == 200) {
    //     final List<dynamic> jsonData = jsonDecode(response.body);
    //     return jsonData.map((item) => Product.fromJson(item)).toList();
    //   } else {
    //     throw Exception('Failed to fetch products');
    //   }
  }

  // Future<http.Response> fetchPhotos(http.Client client) async {
  //   return client.get(Uri.parse(apiUrl));
  // }
}
