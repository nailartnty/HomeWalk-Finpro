import 'package:finpronih/state-manegement/theme_provider';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DescriptionAsset extends StatelessWidget {
  const DescriptionAsset({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Text.rich(
        TextSpan(
          text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec leo elit... ",
          style: TextStyle(
            color: themeProvider.isDarkTheme 
            ? Colors.white.withOpacity(0.8) 
            : Colors.black.withOpacity(0.7),
            fontSize: 15
          ),
          children:  <TextSpan>[
            TextSpan(
              text: "Read More",
              style: TextStyle(
                color: themeProvider.isDarkTheme 
                  ? Colors.white.withOpacity(0.8) 
                  : Colors.black.withOpacity(0.8),
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