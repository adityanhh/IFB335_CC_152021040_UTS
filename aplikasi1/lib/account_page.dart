import 'package:flutter/material.dart';
import 'package:aplikasi1/login.dart';
import 'user.dart';

class AccountPage extends StatelessWidget {
  final User user;

  AccountPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Akun'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name:'),
            TextField(
              readOnly: true,
              controller: TextEditingController(text: user.name),
            ),
            SizedBox(height: 12.0),
            Text('Username:'),
            TextField(
              readOnly: true,
              controller: TextEditingController(text: user.username),
            ),
            SizedBox(height: 12.0),
            Text('Email:'),
            TextField(
              readOnly: true,
              controller: TextEditingController(text: user.email),
            ),
            SizedBox(height: 12.0),
            Text('Phone Number:'),
            TextField(
              readOnly: true,
              controller: TextEditingController(text: user.phoneNumber),
            ),
            SizedBox(height: 12.0),
            Text('Place of Birth:'),
            TextField(
              readOnly: true,
              controller: TextEditingController(text: user.birthplace),
            ),
            SizedBox(height: 12.0),
            Text('Date of Birth:'),
            TextField(
              readOnly: true,
              controller: TextEditingController(text: user.birthdate),
            ),
            SizedBox(height: 12.0),
            Text('Password:'),
            TextField(
              readOnly: true,
              controller: TextEditingController(text: user.password),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text('Back to Login'),
              ),
              // child: Text('Back to Login'),
            ),
          ],
        ),
      ),
    );
  }
}

