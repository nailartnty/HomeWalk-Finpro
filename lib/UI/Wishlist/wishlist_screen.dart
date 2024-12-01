import 'package:finpronih/state-manegement/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Wishlist'),
      ),
      body: wishlistProvider.wishlistItems.isEmpty
          ? const Center(
              child: Text('Your wishlist is empty!'),
            )
          : ListView.builder(
              itemCount: wishlistProvider.wishlistItems.length,
              itemBuilder: (context, index) {
                final wishlist = wishlistProvider.wishlistItems.values.toList();
                final item = wishlist[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 33),
                  child: Column(
                    children: [
                      Dismissible(
                      key: Key(item.id),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        wishlistProvider.removeItemfromFav(item.id);
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('${item.name} removed')));
                      },
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: SizedBox(
                                width: 100, // Lebar tetap
                                height: 100, // Tinggi yang diinginkan
                                child: Image.network(
                                  item.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16), // Jarak antar elemen
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 19
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      const Icon(Icons.local_fire_department, size: 16, color: Colors.teal),
                                      const SizedBox(width: 4),
                                      Text('${item.caloriesPerServing} Kcal'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.access_time, size: 16, color: Colors.teal),
                                      const SizedBox(width: 4),
                                      Text('${item.prepTimeMinutes} Min'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                      // Pemisah garis antara item wishlist
                      const Divider(
                        color: Colors.grey, // Warna garis pemisah
                        thickness: 1, // Ketebalan garis
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
