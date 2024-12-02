import 'package:finpronih/const.dart';
import 'package:flutter/material.dart';

// groceries todo adalah sebuah widget stateful
// digunakan karena data di dalamnya (list tugas) dapat berubah
class GroceriesTodo extends StatefulWidget {
  const GroceriesTodo({super.key});

  @override
  _GroceriesTodoState createState() => _GroceriesTodoState();
}

class _GroceriesTodoState extends State<GroceriesTodo> {
  // texteditingcontroller digunakan untuk mengontrol teks yang dimasukkan pengguna
  // controller ini akan menangkap teks dari textfield agar dapat digunakan atau diproses lebih lanjut
  final TextEditingController _controller = TextEditingController();

  // list string _tasks digunakan untuk menyimpan daftar tugas yang dimasukkan oleh pengguna
  final List<String> _tasks = [];

  // list boolean _isCompleted digunakan untuk menyimpan status apakah tugas sudah selesai atau belum
  // panjang list ini akan selalu sama dengan panjang list _tasks
  final List<bool> _isCompleted = [];

  // fungsi _addTask akan menambahkan tugas baru ke dalam list _tasks
  void _addTask() {
    // jika teks di dalam textfield tidak kosong
    if (_controller.text.isNotEmpty) {
      setState(() {
        // tambahkan teks yang ada di textfield ke dalam list _tasks
        _tasks.add(_controller.text);

        // tambahkan nilai default false ke dalam _isCompleted
        // false berarti tugas belum selesai
        _isCompleted.add(false);
      });

      // setelah tugas ditambahkan, kosongkan teks di textfield
      _controller.clear();
    }
  }

  // fungsi _toggleTaskCompletion digunakan untuk mengubah status selesai sebuah tugas
  void _toggleTaskCompletion(int index) {
    setState(() {
      // ubah nilai boolean di list _isCompleted untuk tugas pada indeks tertentu
      // jika sebelumnya false (belum selesai), maka akan menjadi true (selesai), dan sebaliknya
      _isCompleted[index] = !_isCompleted[index];
    });
  }

  // fungsi _removeTask digunakan untuk menghapus tugas dari daftar
  void _removeTask(int index) {
    setState(() {
      // hapus elemen dari list _tasks pada indeks tertentu
      _tasks.removeAt(index);

      // hapus status selesai (boolean) yang terkait dengan tugas tersebut
      _isCompleted.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar adalah bagian atas aplikasi yang menampilkan judul
      appBar: AppBar(
        title: const Text('groceries todo list',),
      ),
      // body adalah bagian utama aplikasi
      body: Padding(
        // padding digunakan untuk memberikan jarak di dalam widget
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Column(
          children: [
            // menampilkan teks judul daftar tugas
            const Text(
              "Groceries list",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
              textAlign: TextAlign.left,
            ),
            // menambahkan jarak di sekitar elemen input
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    // textfield untuk memasukkan tugas baru
                    child: TextField(
                      controller: _controller, // menghubungkan textfield dengan controller
                      decoration: const InputDecoration(
                        labelText: 'add a task', // teks petunjuk untuk pengguna
                      ),
                    ),
                  ),
                  // tombol untuk menambahkan tugas ke daftar
                  IconButton(
                    icon: const Icon(Icons.add), // ikon tombol tambah
                    onPressed: _addTask, // memanggil fungsi _addTask saat ditekan
                  ),
                ],
              ),
            ),
            // expanded digunakan untuk mengisi sisa ruang yang tersedia
            Expanded(
              // listview.builder adalah widget untuk membuat daftar dengan elemen yang dihasilkan secara dinamis
              child: ListView.builder(
                itemCount: _tasks.length, // menentukan jumlah item di daftar
                itemBuilder: (context, index) {
                  // sortedIndices adalah daftar indeks yang diurutkan
                  // tugas yang belum selesai muncul di atas, dan tugas yang selesai di bawah
                  List<int> sortedIndices = List.generate(_tasks.length, (i) => i);
                  sortedIndices.sort((a, b) {
                    if (_isCompleted[a] && !_isCompleted[b]) return 1; // selesai di bawah
                    if (!_isCompleted[a] && _isCompleted[b]) return -1; // belum selesai di atas
                    return 0; // tidak ada perubahan urutan
                  });

                  // sortedIndex adalah indeks dari elemen berdasarkan urutan baru
                  int sortedIndex = sortedIndices[index];

                  // setiap elemen dalam list ditampilkan menggunakan listtile
                  return ListTile(
                    leading: Checkbox(
                      // checkbox untuk menandai apakah tugas selesai atau belum
                      value: _isCompleted[sortedIndex],
                      onChanged: (value) {
                        // jika checkbox diubah, ubah status selesai tugas
                        _toggleTaskCompletion(sortedIndex);
                      },
                    ),
                    // teks tugas
                    title: Text(
                      _tasks[sortedIndex],
                      style: TextStyle(
                        // jika tugas selesai, teks akan dicoret
                        decoration: _isCompleted[sortedIndex]
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    // tombol untuk menghapus tugas
                    trailing: IconButton(
                      icon: const Icon(Icons.delete), // ikon hapus
                      onPressed: () => _removeTask(sortedIndex), // panggil fungsi hapus
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
