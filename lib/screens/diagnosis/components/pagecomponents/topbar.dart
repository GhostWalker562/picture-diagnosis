import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picture_diagnosis/bloc/tflite/tflite_bloc.dart';
import 'package:picture_diagnosis/core/sizeconfig.dart';

class TopBar extends StatefulWidget {
  const TopBar({Key key}) : super(key: key);

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  String text = "Need Image";

  @override
  Widget build(BuildContext context) {
    return BlocListener<TfliteBloc, TfliteState>(
      listener: (context, state) {
        if (state is TfliteLoaded) {
          List<dynamic> output = state.output;
          String label;
          output.forEach((out){
            // Searches for the highest confidence level.
            double highConfidence = 0;
            if (out['confidence'] > highConfidence){
              highConfidence = out['confidence'];
              label = out['label'];
            }
          });
          

         setState((){
           text = label;
         }) ;
        }
      },
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Color(0xFF984447),blurRadius: 10)],
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFF476C9B),
                border: Border.all(color: Color(0xFFADD9F4), width: 3)),
            height: Sc.blockSizeVertical * 10,
            width: Sc.blockSizeVertical * 10,
            child: IconButton(
              icon: Icon(
                AntDesign.camera,
                color: Color(0xFFADD9F4),
              ),
              onPressed: () =>
                  BlocProvider.of<TfliteBloc>(context).add(TfliteClassify()),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Color(0xFFADD9F4),blurRadius: 10)],
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFF476C9B),
                border: Border.all(color: Color(0xFFADD9F4), width: 3)),
            height: Sc.blockSizeVertical * 10,
            width: Sc.blockSizeVertical * 35,
            child: Center(child: Text(text, style: GoogleFonts.vollkorn(fontSize:24,color: Colors.white),)),
          ),
        ],
      ),
    );
  }
}
