import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final TextEditingController _controller = TextEditingController();
  String _rank = '';

  void _calculateRank() {
    // Mengambil nilai dari inputan
    final String input = _controller.text;
    if (input.isEmpty) {
      setState(() {
        _rank = 'Silakan masukkan nilai';
      });
      return;
    }

    // Mengonversi inputan menjadi angka
    final double? value = double.tryParse(input);
    if (value == null) {
      setState(() {
        _rank = 'Masukkan angka yang valid';
      });
      return;
    }

    // Menentukan rank berdasarkan nilai
    if (value >= 85) {
      _rank = "RANK A";
    } else if (value >= 75) {
      _rank = "B";
    } else if (value >= 65) {
      _rank = "C";
    } else if (value >= 50) {
      _rank = "D";
    } else {
      _rank = "E";
    }

    // Memperbarui state untuk menampilkan rank
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menentukan Grade Nilai'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _rank,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Masukkan nilai (0-100)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateRank,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.deepPurple,
                backgroundColor: const Color.fromARGB(
                    255, 218, 215, 223), // Mengubah warna teks tombol
              ),
              child: const Text('Lihat Rank Nilai'),
            ),
          ],
        ),
      ),
    );
  }
}
