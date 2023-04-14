import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Center(
            child: Text(
              "Register",
              style: TextStyle(color: Colors.blue, fontSize: 40),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "Isi Sesuai nafsu",
              style: TextStyle(color: Colors.blue, fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
