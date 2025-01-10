import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({
    Key? key,
    required this.meal,
    required this.onToggleFavorite,
  }) : super(key: key);

  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              onToggleFavorite(meal);
            },
            icon: const Icon(
              Icons.favorite,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              meal.imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "Ingredients",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            for (final ingredient in meal.ingredients)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    const Icon(Icons.circle,
                        size: 6, color: Colors.white), // White bullet point
                    const SizedBox(width: 8), // Space between dot and text
                    Expanded(
                      child: Text(
                        ingredient,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "Instructions",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            for (int i = 0; i < meal.steps.length; i++)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Aligns number and text
                  children: [
                    // Step number with fixed width for alignment
                    SizedBox(
                      width: 30, // Fixed width for number alignment
                      child: Text(
                        "${i + 1}.", // Numbering steps
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    const SizedBox(width: 8), // Space between number and text
                    Expanded(
                      child: Text(
                        meal.steps[i],
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
