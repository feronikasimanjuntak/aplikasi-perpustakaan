import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating;
  final bool isFavourite, isPopular;

  Product({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.description,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/Book4.jpg",
      "assets/images/Book3.jpg",
      "assets/images/Book1.jpg",
      "assets/images/Book2.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Buku 4",
    description: description,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "assets/images/Book3.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Buku 3",
    description: description,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/Book2.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Buku 2",
    description: description,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/images/Book1.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Buku 1",
    description: description,
  ),
];

const String description =
    "test";
