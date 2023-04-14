import 'package:flutter/material.dart';
import 'package:tugas_pbm_pertemuan_6/page/register_page.dart';
import 'package:tugas_pbm_pertemuan_6/page/home_page.dart';
import 'Header_Login.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key, required this.username, required this.password});
  final username;
  final password;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 80,
                  ),
                  Icon(
                    Icons.apple,
                    color: Colors.blue,
                    size: 100,
                  ),
                  Header(),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.blue))),
                    child: TextFormField(
                      controller: _username,
                      decoration: InputDecoration(
                          hintText: "Enter your username",
                          hintStyle: TextStyle(color: Colors.blue),
                          border: InputBorder.none),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Fill the Blank ';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.blue))),
                    child: TextFormField(
                      controller: _password,
                      decoration: InputDecoration(
                          hintText: "Enter your Password",
                          hintStyle: TextStyle(color: Colors.blue),
                          border: InputBorder.none),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Fill the Blank ';
                        }
                        return null;
                      },
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        // Navigator.of(context).pushNamed("/login");
                        if (_formKey.currentState!.validate()) {
                          if (_username.text.toString() !=
                                  username[0].toString() ||
                              _password.text.toString() !=
                                  password[0].toString()) {
                            // return 'username atau password salah';
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content:
                                      Text('username atau password salah')),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    HomePage(username: username),
                              ),
                            );
                          }
                        }
                      },
                      child: const Text("submit"))
                ],
              ))),

      //TODO : Buat tampilan register
    );
  }
}
