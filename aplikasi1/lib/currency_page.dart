import 'package:flutter/material.dart';

void main() {
  runApp(CurrencyConverterPage());
}

class CurrencyConverterPage extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KOnversi Mata Uang',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CurrencyConverter(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  double amount = 0.0;
  String? selectedCurrency = 'IDR';
  double result = 0.0;
  String? selectedConversionDirection = 'IDR to USD';

  static const currencies = ['USD', 'EUR', 'JPY', 'IDR'];

  Map<String, double> exchangeRates = {
    'USD': 0.00006,
    'EUR': 0.85,
    'JPY': 113.60,
    'IDR': 1.000,
  };

  void convertCurrency() {
    if (selectedCurrency != null) {
      setState(() {
        if (selectedConversionDirection == 'IDR to USD') {
          result = amount * (exchangeRates[selectedCurrency] ?? 0.0);
        } else {
          // IDR to USD
          result = amount / (exchangeRates[selectedCurrency] ?? 1.0);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konversi Mata Uang'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/konversi.jpg'), // Tambahkan gambar suhu di sini
            SizedBox(height: 15.0),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Jumlah Mata Uang'),
              onChanged: (value) {
                setState(() {
                  amount = double.parse(value);
                });
              },
            ),
            DropdownButton<String>(
              value: selectedCurrency,
              items: currencies.map((currency) {
                return DropdownMenuItem<String>(
                  value: currency,
                  child: Text(currency),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCurrency = value;
                });
              },
            ),
            // Row(
            //   children: [
            //     Radio<String>(
            //       value: 'USD to IDR',
            //       groupValue: selectedConversionDirection,
            //       onChanged: (value) {
            //         setState(() {
            //           selectedConversionDirection = value;
            //         });
            //       },
            //     ),
            //     Text('USD to IDR'),
            //     Radio<String>(
            //       value: 'IDR to USD',
            //       groupValue: selectedConversionDirection,
            //       onChanged: (value) {
            //         setState(() {
            //           selectedConversionDirection = value;
            //         });
            //       },
            //     ),
            //     Text('IDR to USD'),
            //   ],
            // ),
            ElevatedButton(
              onPressed: convertCurrency,
              child: Text('Konversi'),
            ),
            Text('Hasil: $result ${selectedCurrency ?? ''}'),
          ],
        ),
      ),
    );
  }
}
