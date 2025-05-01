import 'package:flutter/material.dart';
import 'package:shopping_list_app/models/category_mode.dart';

final categories = {
  Category.vegetables: CategoryModel(
    title: 'Vegetables',
    color: Color.fromARGB(255, 0, 255, 128),
  ),
  Category.carbs: CategoryModel(
    title: 'Carbs',
    color: Color.fromARGB(255, 0, 60, 255),
  ),
  Category.convenience: CategoryModel(
    title: 'Convenience',
    color: Color.fromARGB(255, 191, 0, 255),
  ),
  Category.dairy: CategoryModel(
    title: 'Dairy',
    color: Color.fromARGB(255, 0, 208, 255),
  ),
  Category.fruit: CategoryModel(
    title: 'Fruit',
    color: Color.fromARGB(255, 145, 255, 0),
  ),
  Category.hygiene: CategoryModel(
    title: 'Hygiene',
    color: Color.fromARGB(255, 149, 0, 255),
  ),
  Category.meat: CategoryModel(
    title: 'Meat',
    color: Color.fromARGB(255, 255, 102, 0),
  ),
  Category.other: CategoryModel(
    title: 'Other',
    color: Color.fromARGB(255, 0, 225, 255),
  ),
  Category.spices: CategoryModel(
    title: 'Spices',
    color: Color.fromARGB(255, 255, 187, 0),
  ),
  Category.sweets: CategoryModel(
    title: 'Sweets',
    color: Color.fromARGB(255, 255, 149, 0),
  ),
};
