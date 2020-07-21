import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picture_diagnosis/bloc/tflite/tflite_bloc.dart';
import 'package:picture_diagnosis/core/sizeconfig.dart';
import 'package:tflite/tflite.dart';

class CancerPage extends StatefulWidget {
  const CancerPage({Key key}) : super(key: key);

  @override
  _CancerPageState createState() => _CancerPageState();
}

class _CancerPageState extends State<CancerPage> {
  @override
  void initState() {
    BlocProvider.of<TfliteBloc>(context).add(TfliteLoadModel(
        "assets/melanoma/model_unquant.tflite", "assets/melanoma/labels.txt"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: Sc.blockSizeHorizontal * 5,
          vertical: Sc.blockSizeVertical),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFF476C9B),
                    border: Border.all(color: Color(0xFF984447), width: 3)),
                height: Sc.blockSizeVertical * 10,
                width: Sc.blockSizeVertical * 10,
                child: IconButton(
                  icon: Icon(
                    AntDesign.camera,
                    color: Color(0xFF984447),
                  ),
                  onPressed: () => BlocProvider.of<TfliteBloc>(context)
                      .add(TfliteClassify()),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFF476C9B),
                    border: Border.all(color: Color(0xFFADD9F4), width: 3)),
                height: Sc.blockSizeVertical * 10,
                width: Sc.blockSizeVertical * 40,
              ),
            ],
          ),
          Expanded(
            child:
                BlocBuilder<TfliteBloc, TfliteState>(builder: (context, state) {
              if (state is TfliteLoading) {
                return Center(child: Text("Loading", style: TextStyle(color: Colors.white)));
              }
              if (state is TfliteUnloaded) {
                return Container(
                    child: Center(
                        child: Text(
                  "Cancer",
                  style: GoogleFonts.vollkorn(color: Colors.white),
                )));
              }
              return Text("Loading more",
                  style: TextStyle(color: Colors.white));
            }),
          )
        ],
      ),
    );
  }
}
