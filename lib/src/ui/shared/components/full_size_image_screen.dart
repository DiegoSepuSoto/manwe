import 'package:flutter/material.dart';

class FullSizeImageScreen extends StatelessWidget {
  final String image;

  const FullSizeImageScreen({required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Image.network(
            image,
          ),
        ),
      ),
    );
  }
}