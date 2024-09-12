import 'package:flutter/material.dart';
import 'package:quote_generator/screens/SecondScreen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => SecondScreen()));
          },
          child: Text("Go to Next Screen"),
        ),
      ),
    );
  }
}
