import 'package:flutter/material.dart';
// wishlistitem adalah model data untuk item yang disimpan di wishlist
class WishlistItem {
  final String id; // id unik untuk membedakan setiap item
  final String name; // nama item, misalnya nama resep
  final int prepTimeMinutes; // waktu persiapan resep dalam menit
  final String image; // url untuk gambar item
  final int caloriesPerServing; // jumlah kalori per porsi dari resep

  // konstruktor untuk membuat instance wishlistitem
  WishlistItem({
    required this.id, // id harus disediakan saat membuat objek
    required this.name, // nama juga harus diberikan
    required this.prepTimeMinutes, // waktu persiapan wajib diisi
    required this.image, // url gambar wajib diisi
    required this.caloriesPerServing, // jumlah kalori juga harus ada
  });
}

// wishlistprovider adalah provider yang mengatur data wishlist
class WishlistProvider with ChangeNotifier {
  // map untuk menyimpan item-item wishlist
  // key berupa id, dan value berupa objek wishlistitem
  final Map<String, WishlistItem> _wishlistItems = {};

  // getter untuk mengembalikan seluruh item di wishlist
  // menggunakan operator spread untuk menghindari perubahan langsung ke map aslinya
  Map<String, WishlistItem> get wishlistItems => {..._wishlistItems};

  // metode untuk menambahkan item baru ke wishlist
  void addItemToFav({
    required String id, // id dari item yang akan ditambahkan
    required String name, // nama dari item
    required int prepTimeMinutes, // waktu persiapan item
    required String image, // url gambar item
    required int caloriesPerServing, // jumlah kalori dari item
  }) {
    // cek apakah item dengan id tertentu sudah ada di wishlist
    if (!_wishlistItems.containsKey(id)) {
      // jika belum ada, tambahkan item baru ke map
      _wishlistItems.putIfAbsent(
        id, // id digunakan sebagai key
        () => WishlistItem(
          id: id, // mengisi id item
          name: name, // mengisi nama item
          prepTimeMinutes: prepTimeMinutes, // mengisi waktu persiapan
          image: image, // mengisi url gambar
          caloriesPerServing: caloriesPerServing, // mengisi kalori per porsi
        ),
      );
      // memanggil notifiylisteners untuk memberi tahu widget yang mendengarkan bahwa ada perubahan
      notifyListeners();
    }
  }

  // metode untuk menghapus item dari wishlist berdasarkan id
  void removeItemfromFav(String id) {
    // menghapus item dari map menggunakan id
    _wishlistItems.remove(id);
    // memberitahu listener bahwa ada perubahan pada data
    notifyListeners();
  }
}
