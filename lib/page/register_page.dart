import 'package:flutter/material.dart';
import 'package:tugas_pbm_pertemuan_6/page/login_page.dart';
import 'Header_Register.dart';

List username = [];
List password = [];

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  RegisterPage createState() {
    return RegisterPage();
  }
}

class RegisterPage extends State<MyCustomForm> {
  // RegisterPage({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 100,
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
                          border:
                              Border(bottom: BorderSide(color: Colors.blue))),
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
                    // Container(
                    //   padding: EdgeInsets.all(10),
                    //   decoration: BoxDecoration(
                    //       border:
                    //           Border(bottom: BorderSide(color: Colors.grey))),
                    //   child: TextFormField(
                    //     controller: _email,
                    //     decoration: InputDecoration(
                    //         hintText: "Enter your Email",
                    //         hintStyle: TextStyle(color: Colors.grey),
                    //         border: InputBorder.none),
                    //     validator: (value) {
                    //       if (value == null || value.isEmpty) {
                    //         return 'Fill the Blank ';
                    //       }
                    //       return null;
                    //     },
                    //   ),
                    // ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.blue))),
                      child: TextFormField(
                        controller: _password,
                        decoration: InputDecoration(
                            hintText: "Make your Password",
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
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            username.add(_username.text);
                            password.add(_password.text);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(
                                  username: username,
                                  password: password,
                                ),
                              ),
                            );
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => LoginPage(password: password, username: null,),
                            //   ),
                            // );
                            // Text(_username.text);
                            // String a = toString(_username.value);
                            // child: const Text(toString(123));
                            Navigator.of(context).pushNamed("/login");
                            // final String text = _username.text;
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   SnackBar(content: Text(username[0])),
                            // );
                          }
                        },
                        child: const Text("submit"))
                  ],
                ))),

        //TODO : Buat tampilan register
      ),
    );
  }
}
