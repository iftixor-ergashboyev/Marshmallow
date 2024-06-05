import 'package:flutter/material.dart';
import 'package:marshmallow/presentation/page/category_page.dart';

void main() {
  runApp(const Marshmallow());
}
class Marshmallow extends StatelessWidget {
  const Marshmallow({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true
      ),
      home: const CategoryPage(),
    );
  }
}
