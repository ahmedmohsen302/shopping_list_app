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

class CategoryMode {
  final String title;
  final Color color;

  CategoryMode({required this.title, required this.color});
}
