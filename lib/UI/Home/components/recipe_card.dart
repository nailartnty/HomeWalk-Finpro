import 'package:finpronih/UI/Wishlist/components/fav_button.dart';
import 'package:finpronih/UI/detail/detail_screen.dart';
import 'package:finpronih/models/recipes_model.dart';
import 'package:finpronih/models/services.dart';
import 'package:finpronih/state-manegement/theme_provider';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecipeCard extends StatefulWidget {
  const RecipeCard({super.key});

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  List <Recipe> recipesModel = [];

  myRecipes() {
    recipesItems().then((value) {
      setState(() {
        recipesModel = value;
      });
    });
  }
  @override
  void initState() {
    myRecipes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return SingleChildScrollView(
      child: GridView.builder( 
        shrinkWrap: true,
        itemCount: recipesModel.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 1, // Jarak vertikal antar item
            crossAxisSpacing: 1, // Jarak horizontal antar item
            childAspectRatio: 1.30, // Perbandingan lebar dan tinggi item
          ),
        itemBuilder: (context, index){
          final recipes = recipesModel[index];
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal:  8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(recipe: recipes)
                    )
                  );
                },
                child: Container(
                    decoration: BoxDecoration(
                      color: themeProvider.isDarkTheme ? const Color(0xFF303030) : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                ),
                                child: Image.network(
                                  (recipes.image),
                                  height: 150,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                  
                            Positioned(
                              top: 10,
                              right: 10,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 5,
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: FavButton(recipe: recipes)

                                ),
                              ),
                            )
                          ],
                        ),
                  
                        //content nya
                         Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                recipes.name,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: themeProvider.isDarkTheme ? Colors.white : Colors.black,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.local_fire_department,
                                        size: 16,
                                        color: Colors.teal,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        '${recipes.caloriesPerServing} Kcal',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: themeProvider.isDarkTheme ? Colors.grey.shade400 : Colors.grey.shade700,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 16),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.access_time,
                                        size: 16,
                                        color: Colors.teal,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        '${recipes.prepTimeMinutes} Min',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: themeProvider.isDarkTheme ? Colors.grey.shade400 : Colors.grey.shade700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
            ),
          );
        }
      ),
    );
  }
}