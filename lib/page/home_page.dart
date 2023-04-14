import 'package:flutter/material.dart';
import 'package:tugas_pbm_pertemuan_6/page/register_page.dart';

enum Gender {
  male,
  female,
}

class HomePage extends StatefulWidget {
  HomePage({Key? key = null, required this.username});
  final username;
  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  late double _bmi = 0.0;
  Gender _selectedGender = Gender.male;

  void _calculateBMI() {
    double height = double.parse(_heightController.text);
    double weight = double.parse(_weightController.text);
    double bmi = weight / (height * height);
    setState(() {
      _bmi = bmi;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selamat Datang, ' + widget.username[0]),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              controller: _heightController,
              decoration: InputDecoration(
                hintText: 'Enter your height in meters (m)',
                hintStyle: TextStyle(color: Colors.blue),
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: _weightController,
              decoration: InputDecoration(
                hintText: "Enter your weight in kilograms (kg)",
                hintStyle: TextStyle(color: Colors.blue),
              ),
            ),
            SizedBox(height: 20),
            Text('Select Your Gender', style: TextStyle(color: Colors.blue)),
            Column(
              children: [
                ListTile(
                  title:
                      const Text('Male', style: TextStyle(color: Colors.blue)),
                  leading: Radio<Gender>(
                    value: Gender.male,
                    groupValue: _selectedGender,
                    onChanged: (Gender? value) {
                      setState(() {
                        _selectedGender = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Female',
                      style: TextStyle(color: Colors.blue)),
                  leading: Radio<Gender>(
                    value: Gender.female,
                    groupValue: _selectedGender,
                    onChanged: (Gender? value) {
                      setState(() {
                        _selectedGender = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: Text('Calculate BMI'),
            ),
            SizedBox(height: 20),
            if (_bmi != null)
              Column(
                children: [
                  Text(
                    'Your BMI is: ${_bmi.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 20, color: Colors.blue),
                  ),
                  Text(
                    'Your BMI for ${_selectedGender.toString().split('.').last} is: ${(_bmi - 2).toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 20, color: Colors.blue),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
