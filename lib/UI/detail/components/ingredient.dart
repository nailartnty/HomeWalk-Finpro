import 'package:flutter/material.dart';

class Ingredient extends StatelessWidget {
  const Ingredient({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Ingredient Recipe",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              Icon(Icons.book, color: Colors.blue,)
            ],
          ),

        // Ini card nya
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 20),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    spreadRadius: 1,
                  )
                ]
              ),
              child: Row(
                children: [
                  
                  // Image
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/dummy_photo.png"),
                        fit: BoxFit.cover, //biar gambarnya bisa menyesuaikan full continer
                      ),
                    ),
                    width: 80,
                    height: 80,
                  ),
                  
                  const SizedBox(width: 10), //ngasih jarak antar gambar dan teks
                  
                  // Teks nya
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bawang Goreng", //nama bahan
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        "2 Sium", //jumlah bahan
                        style: TextStyle(
                          color: Colors.blue
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}