import 'package:finpronih/state-manegement/theme_provider';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // kita kenalin dulu provider kita
  final themeProvider = Provider.of<ThemeProvider>(context);
    // Daftar pilihan bahasa
    final List<String> languages = ['English', 'Bahasa Indonesia', 'Français'];
    String selectedLanguage = languages[0]; // Bahasa default

    // Ukuran font default
    double fontSize = 16;

    // Notifikasi default
    bool notificationsEnabled = true;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: [
          IconButton(
            // ini adalah tombol untuk mengganti tema aplikasi
            onPressed: () {
              // pake bang operator karena, untuk aplikasi yang dijalankan berarti tema yang muncul itu terang, karena isDarkTheme-nya false
              // ini adalah proses utamanya
              // bang operator, pertama untuk nullable yang ada di belakang, kedua negasi yang ada di depan
              themeProvider.toggleTheme(!themeProvider.isDarkTheme);
            },
            icon: Icon(
              themeProvider.isDarkTheme ? Icons.dark_mode : Icons.light_mode,
              color: themeProvider.isDarkTheme ? Colors.white : Colors.amber,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Dropdown untuk mengganti bahasa aplikasi
          ListTile(
            title: const Text("Change App Language"),
            trailing: DropdownButton<String>(
              value: selectedLanguage,
              onChanged: (newLanguage) {
                selectedLanguage = newLanguage!;
                //print("Selected Language: $selectedLanguage");
              },
              items: languages.map((language) {
                return DropdownMenuItem(
                  value: language,
                  child: Text(language),
                );
              }).toList(),
            ),
          ),

          const Divider(),

          // Slider untuk mengatur ukuran font
          ListTile(
            title: const Text("Adjust Font Size"),
            subtitle: Slider(
              value: fontSize,
              min: 10,
              max: 30,
              divisions: 20,
              label: "${fontSize.toInt()}",
              onChanged: (newFontSize) {
                fontSize = newFontSize;
                //print("Font Size: $fontSize");
              },
            ),
          ),

          const Divider(),

          // Switch untuk mengatur notifikasi
          SwitchListTile(
            title: const Text("Enable Notifications"),
            value: notificationsEnabled,
            onChanged: (value) {
              notificationsEnabled = value;
              //print("Notifications Enabled: $notificationsEnabled");
            },
          ),

          const SizedBox(height: 10),
          // Deskripsi pengaturan
          const Text(
            "Switch between dark and light themes below.",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20),
          // Kartu untuk pengaturan tema
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            child: ListTile(
              leading: Icon(
                // Menampilkan ikon sesuai tema
                themeProvider.isDarkTheme ? Icons.dark_mode : Icons.light_mode,
                color: themeProvider.isDarkTheme ? Colors.white : Colors.amber,
              ),
              title: Text(
                themeProvider.isDarkTheme ? "Dark Mode" : "Light Mode",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              // Switch untuk mengganti tema
              trailing: Switch(
                value: themeProvider.isDarkTheme,
                onChanged: (value) {
                  themeProvider.toggleTheme(value);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
