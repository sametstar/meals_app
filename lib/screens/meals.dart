import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget context = ListView.builder(
        itemBuilder: (context, index) => Text(meals[index].id));

    if (meals.isEmpty) {
      context = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("ohh.. there is nothing here"),
            SizedBox(
              height: 16,
            ),
            Text("try another category"),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: context,
    );
  }
}
