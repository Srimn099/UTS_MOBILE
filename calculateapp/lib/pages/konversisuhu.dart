import 'package:flutter/material.dart';

class KonversiSuhuPage extends StatefulWidget {
  const KonversiSuhuPage({super.key});

  @override
  State<KonversiSuhuPage> createState() => _KonversiSuhuPage();
}

class _KonversiSuhuPage extends State<KonversiSuhuPage> {
  TextEditingController etInput = TextEditingController();
  double _inputUser = 0;
  double _result = 0;

  final List<String> listSatuanSuhu = [
    "Celsius",
    "Kelvin",
    "Reamur",
    "Fahrenheit"
  ];
  String selectedSatuanAwal = "Celsius";
  String selectedSatuanTujuan = "Kelvin";

  List<String> listHasil = [];
  final _formKey = GlobalKey<FormState>();

  void _konversiSuhu() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _inputUser = double.tryParse(etInput.text) ?? 0.0;

        if (selectedSatuanAwal == selectedSatuanTujuan) {
          _result = _inputUser;
        } else if (selectedSatuanAwal == "Celsius" &&
            selectedSatuanTujuan == "Kelvin") {
          _result = _inputUser + 273.15;
        } else if (selectedSatuanAwal == "Celsius" &&
            selectedSatuanTujuan == "Reamur") {
          _result = _inputUser * 4 / 5;
        } else if (selectedSatuanAwal == "Celsius" &&
            selectedSatuanTujuan == "Fahrenheit") {
          _result = _inputUser * 9 / 5 + 32;
        } else if (selectedSatuanAwal == "Kelvin" &&
            selectedSatuanTujuan == "Celsius") {
          _result = _inputUser - 273.15;
        } else if (selectedSatuanAwal == "Kelvin" &&
            selectedSatuanTujuan == "Reamur") {
          _result = (_inputUser - 273.15) * 4 / 5;
        } else if (selectedSatuanAwal == "Kelvin" &&
            selectedSatuanTujuan == "Fahrenheit") {
          _result = (_inputUser - 273.15) * 9 / 5 + 32;
        } else if (selectedSatuanAwal == "Reamur" &&
            selectedSatuanTujuan == "Celsius") {
          _result = _inputUser * 5 / 4;
        } else if (selectedSatuanAwal == "Reamur" &&
            selectedSatuanTujuan == "Kelvin") {
          _result = _inputUser * 5 / 4 + 273.15;
        } else if (selectedSatuanAwal == "Reamur" &&
            selectedSatuanTujuan == "Fahrenheit") {
          _result = _inputUser * 9 / 4 + 32;
        } else if (selectedSatuanAwal == "Fahrenheit" &&
            selectedSatuanTujuan == "Celsius") {
          _result = (_inputUser - 32) * 5 / 9;
        } else if (selectedSatuanAwal == "Fahrenheit" &&
            selectedSatuanTujuan == "Kelvin") {
          _result = (_inputUser - 32) * 5 / 9 + 273.15;
        } else if (selectedSatuanAwal == "Fahrenheit" &&
            selectedSatuanTujuan == "Reamur") {
          _result = (_inputUser - 32) * 4 / 9;
        }
        _result = double.parse(_result.toStringAsFixed(3));
        listHasil.add(
          "Konversi dari $selectedSatuanAwal ke $selectedSatuanTujuan: $_inputUser menjadi $_result",
        );
      });
    }
  }

  void _onDropdownChangedAwal(String? value) {
    setState(() {
      if (value != null) {
        selectedSatuanAwal = value;
      }
    });
  }

  void _onDropdownChangedTujuan(String? value) {
    setState(() {
      if (value != null) {
        selectedSatuanTujuan = value;
      }
    });
  }

  // Fungsi untuk mereset riwayat konversi
  void _resetRiwayat() {
    setState(() {
      listHasil.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Konverter Suhu"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Kembali ke halaman sebelumnya (misalnya dashboard)
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Input Form
            Card(
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: etInput,
                        decoration: const InputDecoration(
                          labelText: 'Masukkan suhu',
                          labelStyle: TextStyle(fontSize: 20),
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Masukkan nilai suhu';
                          }
                          if (double.tryParse(value) == null) {
                            return 'Nilai harus berupa angka';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              const Text("Dari"),
                              DropdownButton<String>(
                                items: listSatuanSuhu.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                value: selectedSatuanAwal,
                                onChanged: _onDropdownChangedAwal,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Text("Ke"),
                              DropdownButton<String>(
                                items: listSatuanSuhu.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                value: selectedSatuanTujuan,
                                onChanged: _onDropdownChangedTujuan,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Konversi Button
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.compare_arrows),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: _konversiSuhu,
              label: const Text(
                'Konversi Suhu',
                style: TextStyle(fontSize: 20),
              ),
            ),

            // Riwayat Konversi
            const SizedBox(height: 25),
            const Center(
              child: Text(
                "Riwayat Konversi",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),

            // History List
            Expanded(
              child: ListView.builder(
                itemCount: listHasil.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          listHasil[index],
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // Tombol Reset di pojok kanan bawah
      floatingActionButton: FloatingActionButton(
        onPressed: _resetRiwayat,
        tooltip: 'Reset Riwayat',
        child: const Icon(Icons.restore),
      ),
    );
  }
}
