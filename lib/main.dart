import 'package:flutter/material.dart';
import 'package:shopping_list_app/constants.dart';
import 'package:shopping_list_app/views/home_view.dart';

void main() {
  runApp(const ShoppingListApp());
}

class ShoppingListApp extends StatelessWidget {
  const ShoppingListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: AppBarTheme().copyWith(
          color: kColorScheme.primary,
          centerTitle: true,
          foregroundColor: kColorScheme.onPrimary,
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        brightness: Brightness.dark,
        scaffoldBackgroundColor: kColorScheme.shadow,
      ),
      home: HomeView(),
    );
  }
}
