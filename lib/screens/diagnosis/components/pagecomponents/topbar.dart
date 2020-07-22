import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:picture_diagnosis/bloc/tflite/tflite_bloc.dart';
import 'package:picture_diagnosis/core/sizeconfig.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
            onPressed: () =>
                BlocProvider.of<TfliteBloc>(context).add(TfliteClassify()),
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
    );
  }
}
