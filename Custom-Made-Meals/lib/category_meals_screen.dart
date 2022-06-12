import 'package:flutter/material.dart';

class CategoryMeals extends StatelessWidget {
  final String barTitle;
  final String id;

  CategoryMeals({required this.barTitle, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(barTitle),
      ),
      body: Center(
        child: Text('Recipes for ${barTitle}'),
      ),
    );
  }
}
