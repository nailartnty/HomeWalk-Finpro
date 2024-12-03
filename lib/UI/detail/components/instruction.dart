import 'package:finpronih/const.dart';
import 'package:finpronih/models/recipes_model.dart';
import 'package:finpronih/state-manegement/theme_provider';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Instruction extends StatelessWidget {
  const Instruction({super.key, required this.recipe});
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
            final themeProvider = Provider.of<ThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Instruction Cook",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                Icons.food_bank,
                color: primaryColor,
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Menampilkan setiap instruction dalam card menggunakan List.generate
          Column(
            children: List.generate(recipe.instructions.length, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: themeProvider.isDarkTheme
                        ? const Color(0xFF303030)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: themeProvider.isDarkTheme
                        ? Colors.white.withOpacity(0.5)
                        : Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Step Number
                      Text(
                        "Step ${index + 1}",
                        style:  TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: themeProvider.isDarkTheme
                              ? const Color.fromARGB(255, 132, 215, 221)
                              : primaryColor,
                        ),
                      ),
                      const Divider(color: Colors.grey, thickness: 1),
                      // Instruction Text
                      Text(
                        recipe.instructions[index], // Instruction sesuai index
                        style:  TextStyle(
                          fontSize: 16,
                          color: themeProvider.isDarkTheme
                                  ? Colors.white
                                  : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
