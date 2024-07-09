import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marshmallow/presentation/widget/my_button.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/img.png",fit: BoxFit.cover,width: double.infinity,height: double.infinity,),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/img_2.png',fit: BoxFit.cover,height: 250,),
                  Center(
                    child: Text("Love Calculator",style: GoogleFonts.baloo2(
                        fontSize: 25,
                        color: Colors.white
                    ),),
                  ),
                  MyButton(title: 'Text', icon: Icons.list_alt_outlined ,onClick: () => context.go('/text')),
                  MyButton(title: 'Image', icon: Icons.photo ,onClick: () => context.go('/image')),
                  MyButton(title: 'Fingerprint',icon: Icons.fingerprint, onClick: () => context.go('/finger')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}