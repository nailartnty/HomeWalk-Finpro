import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:finpronih/models/recipes_model.dart';  // Gantilah dengan model yang sesuai
import 'package:finpronih/state-manegement/wishlist_provider.dart';  // Sesuaikan dengan path file

class FavButton extends StatelessWidget {
  const FavButton({super.key, required this.recipe});  // Menggunakan recipe daripada product
  final Recipe recipe;  // Ganti dengan tipe data Recipe

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    final isFavorite = wishlistProvider.wishlistItems.containsKey(recipe.id.toString());

    return IconButton(
      onPressed: () {
        if (isFavorite) {
          wishlistProvider.removeItemfromFav(recipe.id.toString());
        } else {
          wishlistProvider.addItemToFav(
            id: recipe.id.toString(),  // Convert ID ke String
            name: recipe.name,  // Sesuaikan dengan nama properti di model Recipe
            prepTimeMinutes: recipe.prepTimeMinutes,  // Sesuaikan dengan properti waktu persiapan di Recipe
            image: recipe.image,  // Sesuaikan dengan gambar resep
            caloriesPerServing: recipe.caloriesPerServing,  // Sesuaikan dengan informasi kalori dari resep
          );
        }
      },
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
        color: isFavorite ? Colors.red : Colors.grey.shade500,
      ),
    );
  }
}
