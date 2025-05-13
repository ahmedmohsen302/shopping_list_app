import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_list_app/data/categories.dart';
import 'package:shopping_list_app/models/grocery_model.dart';
import 'package:shopping_list_app/views/new_item_view.dart';
import 'package:http/http.dart' as http;

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<GroceryModel> newGrocery = [];
  @override
  void initState() {
    super.initState();
    loadItems();
  }

  void loadItems() async {
    final url = Uri.https(
      'shopping-list-app-a20f2-default-rtdb.firebaseio.com',
      'shopping-list.json',
    );
    final response = await http.get(url);
    final Map<String, dynamic> listData = json.decode(response.body);
    final List<GroceryModel> loadedItem = [];
    for (var item in listData.entries) {
      final category =
          categories.entries
              .firstWhere(
                (element) => element.value.title == item.value['category'],
              )
              .value;
      loadedItem.add(
        GroceryModel(
          id: item.key,
          name: item.value['name'],
          quantity: item.value['quantity'],
          category: category,
        ),
      );
    }
    setState(() {
      newGrocery = loadedItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Groceries'),
        actions: [
          IconButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewItemView()),
              );
              loadItems();
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body:
          newGrocery.isEmpty
              ? Center(
                child: Text(
                  'No groceries yet...',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 36,
                  ),
                ),
              )
              : ListView.builder(
                itemCount: newGrocery.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: ValueKey(newGrocery[index].id),
                    onDismissed: (direction) {
                      setState(() {
                        newGrocery.remove(newGrocery[index]);
                      });
                    },
                    child: ListTile(
                      title: Text(
                        newGrocery[index].name,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontSize: 18,
                        ),
                      ),
                      leading: Container(
                        width: 24,
                        height: 24,
                        color: newGrocery[index].category.color,
                      ),
                      trailing: Text(
                        newGrocery[index].quantity.toString(),
                        style: Theme.of(
                          context,
                        ).textTheme.displayLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
