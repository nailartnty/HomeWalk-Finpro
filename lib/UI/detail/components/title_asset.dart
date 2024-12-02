import 'package:finpronih/UI/Wishlist/components/fav_button.dart';
import 'package:finpronih/const.dart';
import 'package:finpronih/models/recipes_model.dart';
import 'package:flutter/material.dart';

class TitleAsset extends StatelessWidget {
  const TitleAsset({super.key, required this.recipe});
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text( //ini buat judul text
            recipe.name,
            style: TextStyle(
              color: Colors.black,
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