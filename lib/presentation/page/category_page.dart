import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marshmallow/presentation/widget/my_button.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset('assets/images/background.png', fit: BoxFit.cover),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/img.png', width: 300, height: 300),
                Text("Marshmallow"),
                MyButton(title: 'Text', onClick: () {}),
                MyButton(title: 'Image', onClick: () {}),
              ],
            ),
          )
        ],
      ),
    );
  }
}
