import 'package:finpronih/const.dart';
import 'package:flutter/material.dart';

class SignForm extends StatelessWidget {
  SignForm({super.key});

  // variable yang kita butuhkan untuk input form
  final _formKey = GlobalKey<FormState>(); // menandakan proses yang terjadi pada file
  final _emailController = TextEditingController(); // kelas yang digunakan untuk mengontrol dan memanipulasi teks dalam widget input seperti TextField atau TextFormField
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email Address',
                  ),
                  validator: (value) {
                    // Parameter value adalah nilai yang diinputkan oleh pengguna dalam TextFormField
                    if (value == null || value.isEmpty) { // Mengecek apakah input kosong atau null. Jika iya, fungsi akan mengembalikan pesan error 'Please enter your email', yang akan ditampilkan di bawah input.
                      return 'Email is Required';
                    } // ! -> menandakan bahwa kondisi ini negatif
                    if (!value.endsWith('@gmail.com')) { // harus validasi @gmail.com (dibelakangnya harus ada)
                      return 'please fill with valid email';
                    }
                    return null; // Jika input tidak kosong, validator mengembalikan nilainya, yang berarti input valid
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController, // ini kita gunakan untuk mengontrol inputan password
                  obscureText: true, // biar dia  tidak kebaca passwordnya
                  decoration: const InputDecoration(
                    labelText: "Password", // label untuk inputan password
                  ),
                  validator: (value) {
                      if (value == null || value.isEmpty) {
                      // Mengecek apakah input kosong
                      return 'Password is Required'; // Jika iya, fungsi akan mengembalikan
                    }
                    return null;
                  },
                ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: primaryColor, 
                      fontSize: 13
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 2), // menghitung/mengambil proporsi ruang berdasarkan nilai flex
              ElevatedButton(
                // Button Login
                onPressed: () {
                  if (_formKey.currentState!.validate()) { // _formKey untuk mengontrol form 
                  //  Memberikan akses ke instance FormState yang terkait dengan form 
                  //// ! untuk menandakan bahwa currentState tidak boleh null
                    Navigator.pushNamed(context, '/home');
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: secondaryColor
                ),
                child: const Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w700
                  ),
                ),
              ),
            ]
          )
        )
      ),
    );
  }
}