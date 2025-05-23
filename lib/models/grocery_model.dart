import 'package:shopping_list_app/models/category_mode.dart';

class GroceryModel {
  final String id;
  final String name;
  final int quantity;
  final CategoryModel category;

  GroceryModel({
    required this.id,
    required this.name,
    required this.quantity,
    required this.category,
  });
}
