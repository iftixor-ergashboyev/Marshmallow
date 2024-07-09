import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marshmallow/presentation/bloc/history/history_bloc.dart';

class HistoryDrawer extends StatefulWidget {
  const HistoryDrawer({super.key});

  @override
  State<HistoryDrawer> createState() => _HistoryDrawerState();
}

class _HistoryDrawerState extends State<HistoryDrawer> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor:  Colors.deepPurpleAccent,
      child: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocConsumer<HistoryBloc, HistoryState>(
            builder: (context, state) {
              if (state is OnHistorySuccess) {
                return ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: state.historyList.length,
                  itemBuilder: (context, index) {
                    final history = state.historyList[index];
                    return ListTile(
                      titleTextStyle: GoogleFonts.bahiana(
                          fontSize: 22,
                          color: Colors.black
                      ),
                      title: Text("${history.boy} & ${history.girl}"),
                      subtitle: Text(history.date),
                      trailing: Text((history.loveValue).toString(),style: const TextStyle(
                          fontSize: 22
                      ),),
                    );
                  },
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
            listener: (context, index) {},
          )),
    );
  }
}