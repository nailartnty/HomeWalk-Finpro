import 'package:finpronih/const.dart';
import 'package:finpronih/models/recipes_model.dart';
import 'package:flutter/material.dart';

class TitleAsset extends StatelessWidget {
  const TitleAsset({super.key, required this.recipe});
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: defaultPadding),
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
          IconButton(
            icon: const Icon(Icons.favorite_border_outlined, color: Colors.grey,),
            onPressed: (){}
          )
        ],
      ),
    );
  }
}