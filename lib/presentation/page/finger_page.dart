import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FingerPage extends StatefulWidget {
  const FingerPage({super.key});

  @override
  State<FingerPage> createState() => _FingerPageState();
}

class _FingerPageState extends State<FingerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(CupertinoIcons.back),
        ),
      ),
      body: Stack(children: [
        Image.asset("assets/images/img.png",
            fit: BoxFit.cover, width: double.infinity),
        Padding(
            padding: const EdgeInsets.all(22.0),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                    ])))
      ]),
    );
  }
}