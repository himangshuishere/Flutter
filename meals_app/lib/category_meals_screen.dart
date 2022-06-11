import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {

  // final String category_id;
  // final String categoryTitle;

  // CategoryMealScreen({required this.category_id, required this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final category_id = routeArgs['id'];
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle!)),
      body: Center(
        child: Text(
          'The Recipes For the ${categoryTitle}',
        ),
      ),
    );
  }
}
