import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
