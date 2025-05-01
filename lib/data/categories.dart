import 'package:flutter/material.dart';
import 'package:shopping_list_app/models/category_mode.dart';

final categories = {
  Category.vegetables: CategoryMode(
    title: 'Vegetables',
    color: Color.fromARGB(255, 0, 255, 128),
  ),
  Category.carbs: CategoryMode(
    title: 'Carbs',
    color: Color.fromARGB(255, 0, 60, 255),
  ),
  Category.convenience: CategoryMode(
    title: 'Convenience',
    color: Color.fromARGB(255, 191, 0, 255),
  ),
  Category.dairy: CategoryMode(
    title: 'Dairy',
    color: Color.fromARGB(255, 0, 208, 255),
  ),
  Category.fruit: CategoryMode(
    title: 'Fruit',
    color: Color.fromARGB(255, 145, 255, 0),
  ),
  Category.hygiene: CategoryMode(
    title: 'Hygiene',
    color: Color.fromARGB(255, 149, 0, 255),
  ),
  Category.meat: CategoryMode(
    title: 'Meat',
    color: Color.fromARGB(255, 255, 102, 0),
  ),
  Category.other: CategoryMode(
    title: 'Other',
    color: Color.fromARGB(255, 0, 225, 255),
  ),
  Category.spices: CategoryMode(
    title: 'Spices',
    color: Color.fromARGB(255, 255, 187, 0),
  ),
  Category.sweets: CategoryMode(
    title: 'Sweets',
    color: Color.fromARGB(255, 255, 149, 0),
  ),
};
