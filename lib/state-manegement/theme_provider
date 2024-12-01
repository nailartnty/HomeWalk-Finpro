import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//set statement tuh penting, dia tuh buat ngatur suatu nilai variable.
//jenis nya : stateful, provider, bloc, (stl ga masuk => cumn buat nampilin ui aja)
//kode klo public brarti bisa di akses di file lain
//knp provider? : gampang bwt pemula, populer, yg rame dipake skrg

//provider itu buat manegemnt state, kalo ngomong in itu pasti ada data yg berubah,
//disini trigger kita itu toggle


//mengimplementasikan konsep oop --> inheritence
class ThemeProvider extends ChangeNotifier { //extend tuh pewarisan, jdi change notifier nurunin warisan ke ThemeProvider
//ini itu mengatur, setter
//ini false biar nanti kalo aplikasi kita dijalanin langsung bukan dark mode
//perbedaan setter dan getter itu publik dan private
bool _isDarkTheme = false; //ini setter


ThemeProvider() { //ini bukn function, nah knp si _loadTheme() dimasukin ke
_loadTheme(); //buat ngelakuin perubahan tema
}

// TODO - pr buat nginget, ini tuh sebernya apa sii?
bool get isDarkTheme => _isDarkTheme; //ini itu getter, jadi dia ngeambil gitu
//kalo kita ga pake getter nanti dia gabisa di panggil di fle lain
//setter dan getter adalah best practice yg ga tertulis

//setter bersifat private
//getter bersifat publik
//getter itu aliasnya setter biar bisa dipanggil kemana mana
//dan perbedaannya di depannya ada underscore

//disini kita buat parameter bool, namanya dark
//terus dia taro async, asycn itu dia bisa menjalankan beberapa proses secara bersamaan
//kalo ada async pasti ada await,
//asyn itu kan kayak menjalankan terus kan, makanya dia juga perlu future
void toggleTheme(bool isDark) async {
//SharedPreferences untuk mengatur perubahan tema gelap dan terang, format nya pake key and value
//si SharedPreferences untuk menghandle konfigurasi perubahan tema secara lokal
SharedPreferences prefs = await SharedPreferences.getInstance();
//kita ambil setter kita yg dimana,
_isDarkTheme = isDark;
//setbool buat mengatur
await prefs.setBool("isDarkTheme", isDark);
//notifyListeners itu punya nya changeNotifier
//ini itu wajib walaupun kita tidak membuat tema
//kalo pake state management provider kita harur pake changenotier(yg mewariskannya), yg ngrecord nya itu notifierlistenernya
notifyListeners();
}

void _loadTheme() async {
SharedPreferences prefs = await SharedPreferences.getInstance();
//?? is elvis operator : buat defining default di variable kita (penjegahan NPE [Null Pointer Exception])
//getbool buat mengambil
_isDarkTheme = prefs.getBool("isDarkTheme") ?? false;//false karna defaultnya light
notifyListeners();
}
}

//klo boiler plate = mendefinisikan 1 atau objek berulang kali, pdh kan bisa extract
//INI FILE WAJIB 
//Compile adalah klo running proses penerjemahan dri bahasa koding ke bahasa mesin.
//klo runtime tuh alatnya, di vscode udh tertanam, alat buat penerjemah