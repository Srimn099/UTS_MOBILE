import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart'; // Tambahkan import ini

class MathOperationPage extends StatefulWidget {
  const MathOperationPage({super.key});

  @override
  State<MathOperationPage> createState() => _MathOperationPageState();
}

class _MathOperationPageState extends State<MathOperationPage> {
  final TextEditingController _controller = TextEditingController();
  String _result = '';

  // Fungsi untuk menghitung hasil
  void _performCalculation() {
    try {
      final String expression = _controller.text;
      // Menjalankan perhitungan ekspresi matematika
      final result = _calculateExpression(expression);
      setState(() {
        _result = 'Hasil: $result';
      });
    } catch (e) {
      setState(() {
        _result = 'Error dalam perhitungan';
      });
    }
  }

  // Fungsi untuk menghitung ekspresi matematika
  double _calculateExpression(String expression) {
    Parser p = Parser();
    Expression exp = p.parse(expression); // Parsing ekspresi yang dimasukkan
    double eval = exp.evaluate(
        EvaluationType.REAL, ContextModel()); // Mengevaluasi ekspresi
    return eval;
  }

  // Fungsi untuk mereset inputan dan hasil
  void _resetFields() {
    setState(() {
      _controller.clear();
      _result = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // TextField untuk input ekspresi matematika
            TextField(
              controller: _controller,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: 'Masukkan perhitungan',
                border: OutlineInputBorder(),
              ),
              style: const TextStyle(fontSize: 32),
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 20),
            // Menampilkan hasil perhitungan
            Text(
              _result,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(height: 20),
            // Grid Tombol Kalkulator
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 20, // 10 angka dan 10 tombol operasi
                itemBuilder: (context, index) {
                  final List<String> buttons = [
                    '7',
                    '8',
                    '9',
                    '/',
                    '4',
                    '5',
                    '6',
                    '*',
                    '1',
                    '2',
                    '3',
                    '-',
                    '0',
                    '.',
                    '=',
                    '+',
                    'C',
                    '(',
                    ')',
                    '%',
                    'DEL'
                  ];

                  return ElevatedButton(
                    onPressed: () {
                      String text = buttons[index];

                      if (text == 'C') {
                        _resetFields();
                      } else if (text == 'DEL') {
                        setState(() {
                          _controller.text = _controller.text.isNotEmpty
                              ? _controller.text
                                  .substring(0, _controller.text.length - 1)
                              : '';
                        });
                      } else if (text == '=') {
                        _performCalculation();
                      } else {
                        setState(() {
                          _controller.text += text;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: buttons[index] == 'C'
                          ? Colors.red
                          : Colors
                              .deepPurple, // Ganti text menjadi buttons[index]                      padding: const EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text(
                      buttons[index],
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
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
