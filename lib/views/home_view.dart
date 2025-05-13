import 'package:flutter/material.dart';
import 'package:shopping_list_app/models/grocery_model.dart';
import 'package:shopping_list_app/views/new_item_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<GroceryModel> newGrocery = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Groceries'),
        actions: [
          IconButton(
            onPressed: () async {
              final newItem = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewItemView()),
              );
              if (newItem == null) return;
              setState(() {
                newGrocery.add(newItem);
              });
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
