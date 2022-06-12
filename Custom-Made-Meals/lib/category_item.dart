import 'package:flutter/material.dart';
import 'package:random_app/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String categoryTitle;
  final Color categoryColor;
  final String id;

  CategoryItem({required this.categoryTitle, required this.categoryColor, required this.id});

  void _onSelection(BuildContext ctx, String title, String id){
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_){
      return CategoryMeals(barTitle: title, id: id);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> _onSelection(context, categoryTitle, id),
      child: Container(
        child: Center(
          child: Text(
            categoryTitle,
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              categoryColor.withOpacity(0.5),
              categoryColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.centerLeft,
          ),
        ),
      ),
    );
  }
}
