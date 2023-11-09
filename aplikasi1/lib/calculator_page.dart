import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String output = '';
  String num1 = '';
  String num2 = '';
  String operand = '';
  double result = 0; // Inisialisasi result
  TextEditingController inputController = TextEditingController(); // Controller untuk TextField

  void buttonPressed(String buttonText) {
    if (buttonText == 'C') {
      output = '';
      num1 = '';
      num2 = '';
      operand = '';
      result = 0; // Inisialisasi result
      inputController.clear(); // Menghapus teks di TextField
    } else if (buttonText == '+' || buttonText == '-' || buttonText == '*' || buttonText == '/') {
      if (num1.isNotEmpty) {
        operand = buttonText;
        output = '';
        inputController.text = '';
      }
    } else if (buttonText == '=') {
      if (num1.isNotEmpty && num2.isNotEmpty) {
        switch (operand) {
          case '+':
            result = double.parse(num1) + double.parse(num2);
            break;
          case '-':
            result = double.parse(num1) - double.parse(num2);
            break;
          case '*':
            result = double.parse(num1) * double.parse(num2);
            break;
          case '/':
            if (num2 != '0') {
              result = double.parse(num1) / double.parse(num2);
            } else {
              result = double.infinity;
            }
            break;
        }
        output = result.toString();
        num1 = result.toString();
        num2 = '';
        operand = '';
        inputController.text = result.toString();
      }
    } else {
      if (operand.isEmpty) {
        num1 += buttonText;
      } else {
        num2 += buttonText;
      }
      output += buttonText;
      inputController.text = output;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: inputController, // Menghubungkan TextField dengan controller
              decoration: InputDecoration(
                labelText: 'Masukkan Angka',
              ),
              // keyboardType: TextInputType.number,
              onChanged: (value) {
                // Handler saat teks di TextField berubah
                output = value;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              output,
              style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildButton('7'),
              buildButton('8'),
              buildButton('9'),
              buildButton('/'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildButton('4'),
              buildButton('5'),
              buildButton('6'),
              buildButton('*'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildButton('1'),
              buildButton('2'),
              buildButton('3'),
              buildButton('-'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildButton('C'),
              buildButton('0'),
              buildButton('='),
              buildButton('+'),
            ],
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.of(context).pop();
          //   },
          //   child: Text('Kembali ke Home'),
          // ),
        ],
      ),
    );
  }

  Widget buildButton(String buttonText) {
    return ElevatedButton(
      onPressed: () {
        buttonPressed(buttonText);
      },
      child: Text(
        buttonText,
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CalculatorPage(),
  ));
}
