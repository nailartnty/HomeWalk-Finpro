import 'package:flutter/material.dart';

class DescriptionAsset extends StatelessWidget {
  const DescriptionAsset({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Text.rich(
        TextSpan(
          text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec leo elit... ",
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 15
          ),
          children: const <TextSpan>[
            TextSpan(
              text: "Read More",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold
              )
            )
          ]
        ),
      ),
    );
  }
}