import 'package:finpronih/UI/Auth/signin_screen.dart';
import 'package:finpronih/UI/Auth/signup_screen.dart';
import 'package:finpronih/UI/Home/components/nav_bar.dart';
import 'package:finpronih/UI/Settings/settings_screen.dart';
import 'package:finpronih/UI/Todolist/groceries_todo.dart';
import 'package:finpronih/UI/Wishlist/wishlist_screen.dart';
import 'package:finpronih/UI/onboarding/onboarding_screen.dart';
import 'package:finpronih/UI/splashscreen/splash.dart';
import 'package:finpronih/state-manegement/theme_provider';
import 'package:finpronih/state-manegement/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => WishlistProvider()),
      ],
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
        title: 'Home Walk',
        theme: ThemeData(
              brightness: themeProvider.isDarkTheme ? Brightness.dark : Brightness.light,
              scaffoldBackgroundColor: themeProvider.isDarkTheme ? Colors.black : Colors.white,
              fontFamily: 'Muli',
              // biar density atau kepadetan mobile app nya, buat adaptive di semua devices
              visualDensity: VisualDensity.adaptivePlatformDensity,
              textTheme: TextTheme(
                bodyMedium: TextStyle(color: themeProvider.isDarkTheme ? Colors.white : Colors.black),
                bodySmall: TextStyle(color: themeProvider.isDarkTheme ? Colors.white : Colors.black),
              )
            ),
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          "/" : (context) => SplashScreen(),
          "/signin" : (context) => SigninScreen(),
          "/onboarding" : (context) => OnboardingScreen(),
          "/signup" : (context) => SignupScreen(),
          "/home" : (context) => HomeScreen(),
          "/favorite" : (context) => WishlistScreen(),
          "/setting" : (context) => SettingsScreen(),
          "/todo" : (context) => GroceriesTodo(),
          // "/detail" : (context) => DetailScreen(recipe: recipes,),
          // "/onboarding" : (context) => OnboardingScreen(),
        },
      );
      }
    );
  }
}
