import 'package:flutter/material.dart';
import 'package:quote_generator/screens/homepage.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
            child: Text("Go Back"),
          ),
        ),
      ),
    );
  }
}
