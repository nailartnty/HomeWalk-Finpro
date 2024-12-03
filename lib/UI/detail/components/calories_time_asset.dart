import 'package:finpronih/const.dart';
import 'package:finpronih/models/recipes_model.dart';
import 'package:finpronih/state-manegement/theme_provider';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CaloriesTimeAsset extends StatelessWidget {
  const CaloriesTimeAsset({super.key, required this.recipe});
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          // Kalori
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: themeProvider.isDarkTheme 
                  ? const Color(0xFF303030) 
                  : const Color.fromARGB(33, 112, 185, 190),
                  borderRadius: BorderRadius.circular(10)
                ),
                child:  const Icon(
                Icons.whatshot, 
                color: primaryColor,
                ),
              ),
              const SizedBox(width: 10,),
              Text(
                "${recipe.caloriesPerServing} KCAL"
                )
            ],
          ),

          // Waktu masak
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: themeProvider.isDarkTheme 
                  ? const Color(0xFF303030) 
                  : const Color.fromARGB(33, 112, 185, 190),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: const Icon(
                  Icons.access_time, 
                color: primaryColor,
                ),
              ),
              const SizedBox(width: 10,),
              Text(
                "${recipe.cookTimeMinutes} Minutes",
                )
            ],
          )
        ],
      ),
    );
  }
}