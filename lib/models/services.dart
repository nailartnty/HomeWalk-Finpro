// ignore_for_file: avoid_print
// baris ini digunakan untuk mengabaikan peringatan linter terkait penggunaan fungsi print
// fungsi print sering dipakai untuk debugging sederhana meskipun dalam praktik yang baik sebaiknya dihindari

import 'package:finpronih/models/recipes_model.dart';
// baris ini mengimpor file recipes_model.dart dari folder models
// recipes_model.dart mungkin berisi fungsi atau model untuk mempermudah pengelolaan data resep

import 'package:http/http.dart' as http;
// baris ini mengimpor library http untuk membuat permintaan http
// http memungkinkan kita melakukan operasi seperti get, post, put, dll., ke server

recipesItems() async {
  // fungsi recipesItems adalah fungsi asinkron
  // fungsi ini digunakan untuk mengambil data resep dari url yang ditentukan
  
  Uri url = Uri.parse("https://dummyjson.com/recipes");
  // membuat variabel url yang merupakan objek Uri
  // url ini adalah alamat api tempat data resep akan diambil

  var res = await http.get(url);
  // mengirimkan permintaan get ke server menggunakan url
  // hasil permintaan ini disimpan dalam variabel res
  // await digunakan untuk menunggu hasil respons sebelum kode melanjutkan

  try {
    // try digunakan untuk menangani error yang mungkin terjadi selama eksekusi kode di dalamnya
    
    if (res.statusCode == 200) {
      // memeriksa apakah status kode respons adalah 200
      // status kode 200 berarti permintaan berhasil dan server merespons dengan data

      var data = recipesModelFromJson(res.body);
      // mengonversi body respons dari server ke dalam bentuk data
      // fungsi recipesModelFromJson kemungkinan didefinisikan dalam file recipes_model.dart
      // data yang sudah diubah akan mempermudah pengolahan dalam aplikasi

      return data.recipes;
      // mengembalikan daftar resep yang ada di dalam data
      
    } else {
      print("Error Occured");
      // jika status kode bukan 200, mencetak pesan error occured
      // ini membantu mengetahui jika ada masalah pada permintaan atau server
    }

  } catch (e) {
    // catch menangkap error yang terjadi pada blok try
    // error bisa berupa kesalahan jaringan, kesalahan format data, dll.

    print(e.toString());
    // mencetak error yang terjadi dalam bentuk string
    // ini berguna untuk debugging atau mencari tahu penyebab kesalahan
  }
}
