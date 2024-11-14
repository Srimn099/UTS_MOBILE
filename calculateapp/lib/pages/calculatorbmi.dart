import 'package:flutter/material.dart';

class CalculatorBmi extends StatefulWidget {
  const CalculatorBmi({super.key});

  @override
  State<CalculatorBmi> createState() => _CalculatorBmiState();
}

class _CalculatorBmiState extends State<CalculatorBmi> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  String _result = '';
  String _message = '';
  String _gender = 'Laki-laki';

  void _calculateBMI() {
    final String weightInput = _weightController.text;
    final String heightInput = _heightController.text;

    if (weightInput.isEmpty || heightInput.isEmpty) {
      setState(() {
        _result = 'Silakan masukkan semua nilai';
        _message = '';
      });
      return;
    }

    final double? weight = double.tryParse(weightInput);
    final double? height = double.tryParse(heightInput);

    if (weight == null || height == null) {
      setState(() {
        _result = 'Masukkan angka yang valid';
        _message = '';
      });
      return;
    }

    // Menghitung BMI
    final double bmi = weight / ((height / 100) * (height / 100));
    String bmiCategory = '';

    // Menentukan kategori BMI
    if (bmi < 18.5) {
      bmiCategory = 'Kekurangan berat badan';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      bmiCategory = 'Normal';
    } else if (bmi >= 25 && bmi < 29.9) {
      bmiCategory = 'Kelebihan berat badan';
    } else {
      bmiCategory = 'Kegemukan';
    }

    setState(() {
      _result = bmi.toStringAsFixed(1);
      _message = bmiCategory;
    });
  }

  void _resetFields() {
    _weightController.clear();
    _heightController.clear();
    _ageController.clear();
    setState(() {
      _result = '';
      _message = '';
      _gender = 'Laki-laki'; // Reset gender ke default
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator BMI'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_result.isNotEmpty) // Menampilkan card hanya jika ada hasil
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Hasil",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.blueGrey,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        _result,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        _message,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            // Dropdown untuk jenis kelamin
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity, // Mengatur lebar sama dengan TextField
              child: DropdownButton<String>(
                isExpanded: true, // Memastikan dropdown mengisi lebar container
                value: _gender,
                items: const [
                  DropdownMenuItem(
                      value: 'Laki-laki', child: Text('Laki-laki')),
                  DropdownMenuItem(
                      value: 'Perempuan', child: Text('Perempuan')),
                ],
                onChanged: (String? newValue) {
                  setState(() {
                    _gender = newValue!;
                  });
                },
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Berat Badan (kg)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Tinggi Badan (cm)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Usia (tahun)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _resetFields,
                  child: const Text('Reset'),
                ),
                ElevatedButton(
                  onPressed: _calculateBMI,
                  child: const Text(' Hitung BMI'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
