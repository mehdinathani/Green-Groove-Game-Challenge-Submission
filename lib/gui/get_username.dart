import 'package:flutter/material.dart';

class TextInputOverlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextField(
                decoration: InputDecoration(labelText: 'Enter your text'),
                // Handle text input changes and controller as needed
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
