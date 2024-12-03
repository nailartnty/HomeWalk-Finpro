import 'package:finpronih/UI/Wishlist/components/fav_button.dart';
import 'package:finpronih/const.dart';
import 'package:finpronih/models/recipes_model.dart';
import 'package:finpronih/state-manegement/theme_provider';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TitleAsset extends StatelessWidget {
  const TitleAsset({super.key, required this.recipe});
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Padding(
      padding:  EdgeInsets.only(top: defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text( //ini buat judul text
            recipe.name,
            style: TextStyle(
              color: themeProvider.isDarkTheme ? Colors.white : Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
          ),
          FavButton(recipe: recipe)
        ],
      ),
    );
  }
}