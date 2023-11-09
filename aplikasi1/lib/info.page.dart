import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 75, // Ukuran lingkaran
              backgroundImage: AssetImage('assets/profile.png'), // Ganti dengan path ke foto pembuat Anda
            ),
            SizedBox(height: 20),
            Text(
              'Aditya Nugraha',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Founder Of This App',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              'Telp: 082117672806',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
