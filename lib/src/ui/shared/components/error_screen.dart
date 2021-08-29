import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            color: Colors.red,
            size: 100.0,
          ),
          Text(
            "Hubo un error :(",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          )
        ],
      ),
    );
  }
}