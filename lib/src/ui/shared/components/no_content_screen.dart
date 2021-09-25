import 'package:flutter/material.dart';

class NoContentScreen extends StatelessWidget {
  const NoContentScreen();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.warning,
            color: Colors.orangeAccent,
            size: 100.0,
          ),
          Text(
            "No hay nada para mostrar",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28.0,
            ),
          )
        ],
      ),
    );
  }
}
