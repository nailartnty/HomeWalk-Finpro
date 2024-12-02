import 'package:finpronih/models/recipes_model.dart';
import 'package:flutter/material.dart';

class ImageDetail extends StatelessWidget {
  // final Recipe recipe;

  const ImageDetail({super.key,});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}