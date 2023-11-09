import 'package:flutter/material.dart';
import 'package:aplikasi1/bmi_page.dart';
import 'package:aplikasi1/calculator_page.dart';
import 'package:aplikasi1/currency_page.dart';
import 'package:aplikasi1/temperature_page.dart';
import 'account_page.dart';
import 'info.page.dart';
import 'user.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // Indeks halaman aktif

  // Daftar halaman yang dapat dipilih
  final List<Widget> _pages = [
    HomePage(), // Halaman "Home"
    AccountPage(
      user: User(
      name: 'Aditya Nugraha',
      username: 'adit',
      email: 'aditya.an21@gmail.com',
      phoneNumber: '085156408686',
      birthplace: 'Bandung',
      birthdate: '12-02-2002',
      password: 'siadit123',
    )
    ), // Halaman "Akun" (buat halaman AccountPage sesuai kebutuhan)
    InfoPage(), // Halaman "Info" (buat halaman InfoPage sesuai kebutuhan)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 3,
          children: <Widget>[
            _buildIconButton(
              'Kalkulator',
              Icons.calculate,
              () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CalculatorPage()));
              },
            ),
            _buildIconButton(
              'Konversi Mata Uang',
              Icons.attach_money,
              () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CurrencyConverterPage()));
              },
            ),
            _buildIconButton(
              'Konversi Suhu',
              Icons.ac_unit,
              () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TemperatureConverterPage()));
              },
            ),
            _buildIconButton(
              'BMI',
              Icons.scale,
              () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>BMICalculator ()));
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
  currentIndex: _currentIndex,
  onTap: (index) {
    setState(() {
      _currentIndex = index;
    });

    // Periksa jika indeks adalah 1 (indeks "Akun")
    if (index == 1) {
      // Navigasi ke halaman "Akun"
      Navigator.push(context, MaterialPageRoute(builder: (context) => AccountPage(
      user: User(
      name: 'Aditya Nugraha',
      username: 'adit',
      email: 'aditya.an21@gmail.com',
      phoneNumber: '085156408686',
      birthplace: 'Bandung',
      birthdate: '12-02-2002',
      password: 'siadit123',
    )
      )
      )
      );
    }
    if (index == 2) {
      // Navigasi ke halaman "Akun"
      Navigator.push(context, MaterialPageRoute(builder: (context) => InfoPage()));
    }
  },
  
  items: [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_circle),
      label: 'Akun',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.info),
      label: 'Info',
    ),
  ],
),
    );
  }

  Widget _buildIconButton(String label, IconData icon, void Function() onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 40,
          ),
          SizedBox(height: 10),
          Text(label),
        ],
      ),
    );
  }
}
