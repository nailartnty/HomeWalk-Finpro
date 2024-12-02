import 'package:flutter/material.dart';

class ImageDetail extends StatelessWidget {
  const ImageDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/dummy_photo.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}