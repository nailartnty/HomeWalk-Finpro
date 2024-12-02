import 'package:finpronih/UI/Home/components/categories.dart';
import 'package:finpronih/UI/Home/components/feature_banner.dart';
import 'package:finpronih/UI/Home/components/recipe_card.dart';
import 'package:finpronih/state-manegement/theme_provider';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatalogueScreen extends StatelessWidget {
  const CatalogueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
       backgroundColor: themeProvider.isDarkTheme ? Colors.black : Colors.white,
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
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30), 
          child: Column( 
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 15,),
               Text(
                'Featured',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  )
                ),
                SizedBox(height: 10,),
                FeatureBanner(),
                SizedBox(height: 20),
               // Bagian kategori
                Categories(),
                SizedBox(height: 20),
                Text(
                  "Popular Recipes",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 15),
                RecipeCard()
              ]
            
          )
        ),
      )

    );
  }
}