import 'package:finpronih/UI/Home/components/feature_banner.dart';
import 'package:flutter/material.dart';

class CatalogueScreen extends StatelessWidget {
  const CatalogueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30) ,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Bagian judul utama dan subtitle
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello welcome to Home Walk!!',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'Chika Maharani',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              // Bagian gambar profil
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage('https://i.pinimg.com/564x/62/ed/b1/62edb18d29859bf263940b08080abdc2.jpg'), // Ganti dengan URL gambar profil
                
              ),
              
            ],
            
          ),
          
        ),
      ),

      //ini yg carousel banner, yg feature itu lohh ya guys ya
      body: const Padding(
        padding: EdgeInsets.all(20), 
        child: Column( 
          children: <Widget>[
            FeatureBanner(),
            Expanded(
            child: Center(
              child: Text(
                'Welcome to the Catalogue Screen!',
                style: TextStyle(fontSize: 16),
              ),
            ),
            )
          ],
        )
      )

    );
  }
}