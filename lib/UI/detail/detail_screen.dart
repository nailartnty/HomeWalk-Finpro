import 'package:finpronih/UI/detail/components/calories_time_asset.dart';
import 'package:finpronih/UI/detail/components/description_asset.dart';
import 'package:finpronih/UI/detail/components/image_detail.dart';
import 'package:finpronih/UI/detail/components/tab_bar_asset.dart';
import 'package:finpronih/UI/detail/components/title_asset.dart';
import 'package:finpronih/const.dart';
import 'package:finpronih/models/recipes_model.dart';
import 'package:finpronih/state-manegement/theme_provider';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.recipe});
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final themeProvider = Provider.of<ThemeProvider>(context);

    

    return Scaffold(
      body: Stack( //biar bisa numpuk2 an
        children: [
          // Gambar header
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ImageDetail(recipe: recipe),//nanti masuk buat liat gambar
          ),

          // App Bar
          Positioned( // berguna biar dia gak mojok banget
            top: 10,
            left: 20,
            right: 20,

            // App bar nya di mulai dari sini
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: GestureDetector( //pake ini karena karna kita full pake widget bukan button
                onTap: () {
                  Navigator.pushNamed(context, "/home");
                },
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: themeProvider.isDarkTheme 
                      ? primaryColor 
                      : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 5,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child:  Icon(
                      Icons.close,
                      color: themeProvider.isDarkTheme 
                      ? Colors.white 
                      : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // End App bar

          // Card detail start
          Positioned(
            top: size.height * 0.3, // Mulai card di bawah gambar biar gak nutup gambar
            left: 0,
            right: 0,

            // ini cardnya di setting2
            child: Container(
              height: size.height * 0.7, // Sisa tinggi layar
              decoration:  BoxDecoration(
                color: themeProvider.isDarkTheme ? Colors.black : Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),

              // ini isi konten dari cardnya
              child: SingleChildScrollView( //pake ini biar isi cardnya aja yg di scroll
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    TitleAsset(recipe: recipe),
                    SizedBox(height: defaultPadding),
                    DescriptionAsset(),
                    SizedBox(height: defaultPadding),
                    CaloriesTimeAsset(recipe: recipe,),
                    SizedBox(height: defaultPadding),
                    TabBarAsset(recipe: recipe,),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
