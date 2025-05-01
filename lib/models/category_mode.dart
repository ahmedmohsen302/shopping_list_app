import 'package:flutter/material.dart';

enum Category {
  vegetables,
  fruit,
  meat,
  dairy,
  carbs,
  sweets,
  convenience,
  spices,
  hygiene,
  other,
}

class CategoryModel {
  final String title;
  final Color color;

  CategoryModel({required this.title, required this.color});
}
