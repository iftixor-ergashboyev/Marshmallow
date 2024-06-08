import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextPage extends StatefulWidget {
  const TextPage({super.key});

  @override
  State<TextPage> createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(icon: const Icon(CupertinoIcons.back, color: CupertinoColors.black,), onPressed: () {
          Navigator.pop(context);
        }),
      ),
    body: Stack(
    children: [
    Image.asset("assets/images/background.png",fit: BoxFit.cover,width: double.infinity),
    Padding(
    padding: const EdgeInsets.all(22.0),
    child: Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    )
    )
    )
    ]
    )
    );
  }
}
