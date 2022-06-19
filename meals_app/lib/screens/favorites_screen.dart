import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoritedMeals;

  FavoriteScreen(this.favoritedMeals);

  @override
  Widget build(BuildContext context) {
    if (favoritedMeals.isEmpty) {
      return Center(
        child: Text('You have no favorites -- start adding some.'),
      );
    }
    else{
      return ListView.builder(
        itemCount: favoritedMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoritedMeals[index].id,
            title: favoritedMeals[index].title,
            imageUrl: favoritedMeals[index].imageUrl,
            duration: favoritedMeals[index].duration,
            complexity: favoritedMeals[index].complexity,
            affordability: favoritedMeals[index].affordability,
          );
        },
      );
    }
  }
}
