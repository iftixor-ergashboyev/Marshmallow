import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marshmallow/domain/model/couple.dart';
import 'package:marshmallow/presentation/bloc/history/history_bloc.dart';
import 'package:marshmallow/presentation/bloc/text/love_bloc.dart';
import 'package:marshmallow/presentation/widget/history_drawer.dart';
import 'package:marshmallow/presentation/widget/my_button.dart';

class TextPage extends StatefulWidget {
  const TextPage({super.key});

  @override
  State<TextPage> createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {

  late ConfettiController _controller;
  late TextEditingController _boy;
  late TextEditingController _girl;

  @override
  void initState() {
    BlocProvider.of<LoveBloc>(context).add(GetLoveInitial());
    _controller = ConfettiController(
        duration: const Duration(seconds: 2)
    );
    _boy = TextEditingController();
    _girl = TextEditingController();
    super.initState();
  }

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
      endDrawer: const HistoryDrawer(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(children: [
            Image.asset(
              "assets/images/img.png",
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Padding(
                padding: const EdgeInsets.all(22.1),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Gap(100),
                      Expanded(
                        child: Card(
                          surfaceTintColor: Colors.white,
                          elevation: 0,
                          child: Stack(children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                  "assets/images/img_1.png",
                                  fit: BoxFit.fill,
                                  width: double.infinity,
                                  height: double.infinity
                              ),
                            ),
                            BlocConsumer<LoveBloc, LoveState>(
                                builder: (context, state) {
                                  if (state is LoveSuccess) { // mano holat
                                    return TweenAnimationBuilder(
                                        tween: IntTween(
                                            begin: 0, end: state.value.toInt()),
                                        duration: const Duration(seconds: 2),
                                        builder: (context, v, s) {
                                          return Center(
                                              child: Text(
                                                "$v%",
                                                style: GoogleFonts.permanentMarker(
                                                    fontSize: 50,
                                                    color: Colors.blueAccent,
                                                    fontWeight: FontWeight.bold),
                                              ));
                                        });
                                  } else {
                                    return Center(
                                        child: Text(
                                          "0",
                                          style: GoogleFonts.permanentMarker(
                                              fontSize: 50,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ));
                                  }
                                },
                                listener: (context, state) {
                                  if(state is LoveSuccess) {
                                    if(state.value >= 70) {
                                      Future.delayed(const Duration(seconds: 2)).then((value) {
                                        _controller.play();
                                      });
                                    }
                                    final now = DateTime.now();
                                    final currentDate = DateTime(now.year,now.month,now.day);
                                    final couple = Couple(id: null, boy: _boy.text, girl: _girl.text, loveValue: state.value, date: currentDate.toString().substring(0,11));
                                    BlocProvider.of<HistoryBloc>(context).add(OnSaveHistory(couple));
                                    BlocProvider.of<HistoryBloc>(context).add(OnGetHistory());
                                  }
                                })
                          ]),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Card(
                                child: SizedBox(
                                    width:
                                    MediaQuery.of(context).size.width / 2.4,
                                    child: TextField(
                                      controller: _boy,
                                      style:
                                      GoogleFonts.robotoMono(fontSize: 18),
                                      decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 12),
                                          border: InputBorder.none,
                                          hintText: "Male"),
                                    ))),
                            Card(
                                child: SizedBox(
                                    width:
                                    MediaQuery.of(context).size.width / 2.4,
                                    child: TextField(
                                      controller: _girl,
                                      style:
                                      GoogleFonts.robotoMono(fontSize: 18),
                                      decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 12),
                                        border: InputBorder.none,
                                        hintText: "Female",
                                      ),
                                    ))),
                          ],
                        ),
                      ),
                      SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: MyButton(
                            onClick: _getRandom,
                            icon: CupertinoIcons.heart_circle_fill,
                            title: "Generate",
                          )),
                      const Gap(100),
                    ]
                )),
            Column(
              children: [
                Center(child: _confetti(),),
                Expanded(child: Container())
              ],
            )
          ]),
        ),
      ),
    );
  }

  _confetti() {
    return ConfettiWidget(
      confettiController: _controller,
      blastDirectionality: BlastDirectionality.explosive,
      blastDirection: 0,
      emissionFrequency: 0.05,
      numberOfParticles: 100,
      maxBlastForce: 50,
      minBlastForce: 20,
      gravity: 0.1,
      colors: const [
        Colors.green,
        Colors.red,
        Colors.yellow,
        Colors.blue,
      ],
      shouldLoop: false,
    );
  }


  _getRandom() {
    final boyName = _boy.text;
    final girlName = _girl.text;
    if(boyName.isEmpty || girlName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Enter Names"),backgroundColor: Colors.red)
      );
      return;
    }
    BlocProvider.of<LoveBloc>(context).add(GetRandomLove(boyName, girlName));
  }
}