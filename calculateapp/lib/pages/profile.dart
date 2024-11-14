import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Import Font Awesome

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Vertikal center
            crossAxisAlignment: CrossAxisAlignment.center, // Horizontal center
            children: [
              // Avatar
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(
                    'assets/images/sri.png'), // Ganti dengan path gambar Anda
              ),
              const SizedBox(height: 16),
              // Nama
              const Text(
                'Nama: Sri Mulyaningsih',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              // Menggunakan Row untuk menampilkan ikon-ikon
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.email, size: 25, color: Colors.deepPurple),
                  SizedBox(width: 8),
                  Text(
                    'sri.mulyaningsih@mhs.itenas.com',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Menggunakan FontAwesome untuk ikon Instagram
                  FaIcon(FontAwesomeIcons.instagram,
                      size: 25, color: Colors.deepPurple),
                  SizedBox(width: 8),
                  Text(
                    '@sri_mningsih',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.phone, size: 25, color: Colors.deepPurple),
                  SizedBox(width: 8),
                  Text(
                    '+62 852 8732 1310',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Tombol Edit Profil
              ElevatedButton(
                onPressed: () {
                  // Aksi ketika tombol ditekan, misalnya untuk mengedit profil
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple, // Warna tombol
                  foregroundColor: Colors.white, // Warna teks tombol
                ),
                child: const Text(
                  'Edit Profil',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
