import 'package:flutter/material.dart';

class OrLine extends StatelessWidget {
  const OrLine({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          Expanded( // mengisi ruang yang kosong
            child: Divider(
              color: Colors.grey,
              thickness: 2, // ketebalan garis pemisah 
            )
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2),
            child: Text(
              "OR",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w900,
                fontSize: 12
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: Colors.grey,
              thickness: 2, // ketebalan garis pemisah 
            )
          ),
        ],
      ),
    );
  }
}