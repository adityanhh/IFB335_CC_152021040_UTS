import 'package:flutter/material.dart';

void main() {
  runApp(SimpleTemperatureConverterApp());
}

class SimpleTemperatureConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature Converter',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: TemperatureConverterPage(),
    );
  }
}

class TemperatureConverterPage extends StatefulWidget {
  @override
  _TemperatureConverterPageState createState() =>
      _TemperatureConverterPageState();
}

class _TemperatureConverterPageState extends State<TemperatureConverterPage> {
  double celsiusValue = 0;
  double fahrenheitValue = 32; // Default value
  double kelvinValue = 273.15; // Default value
  double reamurValue = 0; // Default value

  void convertTemperature() {
    setState(() {
      fahrenheitValue = (celsiusValue * 9 / 5) + 32;
      kelvinValue = celsiusValue + 273.15;
      reamurValue = celsiusValue * 4 / 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konversi Suhu'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/suhu.png'), // Tambahkan gambar suhu di sini
              SizedBox(height: 10.5),
              TextFormField(
                decoration: InputDecoration(labelText: 'Celsius'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    celsiusValue = double.tryParse(value) ?? 0;
                  });
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: convertTemperature,
                child: Text('Convert'),
              ),
              SizedBox(height: 16.0),
              Text('Fahrenheit: $fahrenheitValue°F'),
              Text('Kelvin: $kelvinValue K'),
              Text('Reamur: $reamurValue°Re'),
            ],
          ),
        ),
      ),
    );
  }
}
