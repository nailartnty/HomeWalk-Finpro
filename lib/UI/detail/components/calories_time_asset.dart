import 'package:flutter/material.dart';

class CaloriesTimeAsset extends StatelessWidget {
  const CaloriesTimeAsset({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          // Kalori
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: const Icon(Icons.whatshot),
              ),
              const SizedBox(width: 10,),
              const Text(
                "2000 KCAL",
                )
            ],
          ),

          // Waktu masak
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: const Icon(Icons.access_time),
              ),
              const SizedBox(width: 10,),
              const Text(
                "15 Minutes",
                )
            ],
          )
        ],
      ),
    );
  }
}