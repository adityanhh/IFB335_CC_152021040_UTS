import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: BMICalculator(),
    );
  }
}

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  late TextEditingController _heightController;
  late TextEditingController _weightController;
  double? _bmiResult;
  String _bmiCategory = '';

  @override
  void initState() {
    super.initState();
    _heightController = TextEditingController();
    _weightController = TextEditingController();
  }

  void calculateBMI() {
    double height = double.tryParse(_heightController.text) ?? 1.0;
    double weight = double.tryParse(_weightController.text) ?? 1.0;
    double bmi = weight / ((height / 100) * (height / 100));

    setState(() {
      _bmiResult = bmi;
      if (bmi < 18.5) {
        _bmiCategory = 'Kurang berat badan';
      } else if (bmi >= 18.5 && bmi < 25) {
        _bmiCategory = 'Berat badan normal (ideal)';
      } else if (bmi >= 25 && bmi < 30) {
        _bmiCategory = 'Kelebihan berat badan';
      } else {
        _bmiCategory = 'Obesitas';
      }
    });
  }

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Tinggi (cm)'),
            ),
            SizedBox(height: 15.0),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Berat (kg)'),
            ),
            SizedBox(height: 15.0),
            ElevatedButton(
              onPressed: () {
                calculateBMI();
              },
              child: Text('Hitung BMI'),
            ),
            SizedBox(height: 15.0),
            _bmiResult != null
                ? Text('BMI: ${_bmiResult!.toStringAsFixed(2)}')
                : Container(),
            Text('Kategori: $_bmiCategory'),
          ],
        ),
      ),
    );
  }
}
