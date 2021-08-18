import 'package:flutter/material.dart';

class FullSizeImage extends StatelessWidget {
  final String image;

  const FullSizeImage({required this.image});

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