import 'package:flutter/material.dart';
import 'package:random_app/category_item.dart';

import './category_data.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Daily Meals')),
      body: GridView(
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          ...DUMMY_DATA.map((index) {
            return CategoryItem(
                categoryTitle: index.title, categoryColor: index.color, id: index.id,);
          })
        ],
      ),
    );
  }
}
