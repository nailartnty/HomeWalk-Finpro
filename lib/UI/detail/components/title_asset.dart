import 'package:finpronih/const.dart';
import 'package:flutter/material.dart';

class TitleAsset extends StatelessWidget {
  const TitleAsset({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text( //ini buat judul text
            "Healthy Taco Salad",
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