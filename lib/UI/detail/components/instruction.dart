import 'package:flutter/material.dart';

class Instruction extends StatefulWidget {
  const Instruction({super.key});

  @override
  State<Instruction> createState() => _InstuctionState();
}

class _InstuctionState extends State<Instruction> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Instruction cook",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              Icon(Icons.food_bank, color: Colors.blue,)
            ],
          ),

          // Card instruction
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
              child: const SizedBox(
                width: double.infinity, //biar full screen 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, //karena column defaulttnya ngebuat widget di tengah makannya ngasih ini biar di kiri
                  children: [
                    Text(
                      "Step 1", //step nya
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue
                      ),
                    ),

                    Divider(color: Colors.grey, thickness: 1,), //ngasih garis
                
                    Text( // tatacara nya
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In maximus libero dictum quam interdum, vel feugiat diam elementum."
                    )
                  ],
                ),
              ),
            ),
          ),

          // Card instruction
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
              child: const SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Step 2", //step nya
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue
                      ),
                    ),

                    Divider(color: Colors.grey, thickness: 1,), //ngasih garis
                
                    Text( // tatacara nya
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In maximus libero dictum quam interdum, vel feugiat diam elementum."
                    )
                  ],
                ),
              ),
            ),
          ),
          
          // Card instruction
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
              child: const SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Step 3", //step nya
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue
                      ),
                    ),

                    Divider(color: Colors.grey, thickness: 1,), //ngasih garis
                
                    Text( // tatacara nya
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In maximus libero dictum quam interdum, vel feugiat diam elementum."
                    ),
                    Text( // tatacara nya
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In maximus libero dictum quam interdum, vel feugiat diam elementum."
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}