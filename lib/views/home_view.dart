import 'package:flutter/material.dart';
import 'package:shopping_list_app/data/groceries_data.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Groceries')),
      body: ListView.builder(
        itemCount: groceryItem.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              groceryItem[index].name,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
                fontSize: 18,
              ),
            ),
            leading: Container(
              width: 24,
              height: 24,
              color: groceryItem[index].category.color,
            ),
            trailing: Text(
              groceryItem[index].quantity.toString(),
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
                fontSize: 20,
              ),
            ),
          );
        },
      ),
    );
  }
}
