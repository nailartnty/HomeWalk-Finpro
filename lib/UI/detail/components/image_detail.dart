import 'package:finpronih/models/recipes_model.dart';
import 'package:flutter/material.dart';

class ImageDetail extends StatelessWidget {
  final Recipe recipe;

  const ImageDetail({super.key, required this.recipe,});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(recipe.image), // Ubah ke NetworkImage
          fit: BoxFit.cover,
        ),
      ),

    );
  }
}