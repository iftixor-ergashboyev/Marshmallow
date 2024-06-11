import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({super.key});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
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
              const Padding(
                  padding: EdgeInsets.all(22.0),
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
