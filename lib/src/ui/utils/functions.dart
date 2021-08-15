import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

MarkdownStyleSheet buildPageMarkdownBody() {
  return MarkdownStyleSheet(
    h1: TextStyle(
      fontSize: 22.0,
      fontWeight: FontWeight.bold,
    ),
    p: TextStyle(
      fontSize: 17.0,
    ),
  );
}