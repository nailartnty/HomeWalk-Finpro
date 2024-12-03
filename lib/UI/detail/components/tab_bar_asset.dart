import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:finpronih/UI/detail/components/ingredient.dart';
import 'package:finpronih/UI/detail/components/instruction.dart';
import 'package:finpronih/const.dart';
import 'package:finpronih/models/recipes_model.dart';
import 'package:finpronih/state-manegement/theme_provider';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabBarAsset extends StatefulWidget {
  const TabBarAsset({super.key, required this.recipe});
  final Recipe recipe;

  @override
  State<TabBarAsset> createState() => _TabBarAssetState();
}

class _TabBarAssetState extends State<TabBarAsset> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return DefaultTabController( //ini ngambil dari library
      length: 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Tab Control
          SegmentedTabControl( //ini buat si segment atau bagian
            barDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: themeProvider.isDarkTheme
                ? const Color(0xFF303030)
                : Colors.grey.shade200,
            ),
            tabPadding: const EdgeInsets.all(5),
            tabs:  [
              SegmentTab( //nah segment nya kita setting disni sesuai yang kita mau, semakin banyak segment nya semakin banyak pilhannya
                label: "Ingredient",
                textColor: themeProvider.isDarkTheme
                ? Colors.white
                : Colors.black,
                color: primaryColor,
              ),
              SegmentTab(
                label: "Instruction",
                textColor: themeProvider.isDarkTheme
                ? Colors.white
                : Colors.black,
                color: primaryColor,
              ),
            ],
          ),
          const SizedBox(height: 20), // Jarak antara TabControl dan konten

          // Tab View
           SizedBox(
            height: 400, // Sesuaikan tinggi dengan kebutuhan
            child: TabBarView( //ini tab bar view gunanya untuk menampilkan si bar nya.
              physics: BouncingScrollPhysics(), //ini biar dia punya gerakan yang menarik
              children: [
                SingleChildScrollView( //biar si sectionnya bisa di scroll
                  padding: EdgeInsets.all(8.0),
                  child: Ingredient(recipe: widget.recipe),
                ),
                SingleChildScrollView(
                  padding: EdgeInsets.all(8.0),
                  child: Instruction(recipe: widget.recipe,),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
