import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_list_app/data/categories.dart';
import 'package:shopping_list_app/models/category_mode.dart';
import 'package:shopping_list_app/models/grocery_model.dart';
import 'package:http/http.dart' as http;

class NewItemView extends StatefulWidget {
  const NewItemView({super.key});

  @override
  State<NewItemView> createState() => _NewItemViewState();
}

class _NewItemViewState extends State<NewItemView> {
  final formKey = GlobalKey<FormState>();
  var enteredName = '';
  var enteredQuantity = 1;
  var enteredCategory = categories[Category.meat]!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add new item')),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  cursorColor: Theme.of(context).colorScheme.primary,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 1) {
                      return 'Try adding a valid value';
                    }
                    return null;
                  },
                  maxLength: 500,
                  decoration: InputDecoration(
                    label: Text('Name'),
                    labelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 20,
                    ),
                    enabledBorder: OutlineInputBorder(
                      gapPadding: 24,
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  onSaved: (newValue) {
                    enteredName = newValue!;
                  },
                ),
                SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: TextFormField(
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              int.tryParse(value) == null ||
                              int.tryParse(value)! <= 0) {
                            return 'Try a valid number';
                          }
                          return null;
                        },
                        cursorColor: Theme.of(context).colorScheme.primary,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        keyboardType: TextInputType.number,
                        initialValue: enteredQuantity.toString(),
                        decoration: InputDecoration(
                          label: Text('Quantity'),
                          labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 20,
                          ),
                          enabledBorder: OutlineInputBorder(
                            gapPadding: 24,
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                        onSaved: (newValue) {
                          enteredQuantity = int.parse(newValue!);
                        },
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: DropdownButtonFormField(
                        value: enteredCategory,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 18,
                        ),
                        items: [
                          for (var category in categories.entries)
                            DropdownMenuItem(
                              value: category.value,
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: category.value.color,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    width: 24,
                                    height: 24,
                                  ),
                                  SizedBox(width: 12),
                                  Text(category.value.title),
                                ],
                              ),
                            ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            enteredCategory = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        formKey.currentState!.reset();
                      },
                      child: Text('Reset', style: TextStyle(fontSize: 20)),
                    ),
                    SizedBox(width: 6),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                        }
                        final url = Uri.https(
                          'shopping-list-app-a20f2-default-rtdb.firebaseio.com',
                          'shopping-list.json',
                        );
                        http.post(
                          url,
                          headers: {'Content-Type': 'application/json'},
                          body: json.encode({
                            'name': enteredName,
                            'quantity': enteredQuantity,
                            'category': enteredCategory.title,
                          }),
                        );
                        // Navigator.of(context).pop(
                        //   GroceryModel(
                        //     id: DateTime.now().toString(),
                        //     name: enteredName,
                        //     quantity: enteredQuantity,
                        //     category: enteredCategory,
                        //   ),
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                      ),
                      child: Text('Add item', style: TextStyle(fontSize: 18)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
