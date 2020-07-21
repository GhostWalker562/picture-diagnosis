import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:picture_diagnosis/core/sizeconfig.dart';

class Hotbar extends StatelessWidget {
  const Hotbar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xFF476C9B),
          border: Border.all(color: Color(0xFFADD9F4), width: 3)),
      padding: EdgeInsets.symmetric(
        horizontal: Sc.blockSizeHorizontal * 2.5,
      ),
      margin: EdgeInsets.symmetric(
          horizontal: Sc.blockSizeHorizontal * 5,
          vertical: Sc.blockSizeVertical * 2.5),
      width: Sc.blockSizeHorizontal * 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(AntDesign.key),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(AntDesign.barcode),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(AntDesign.hourglass),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(AntDesign.skin),
            onPressed: null,
          ),
        ],
      ),
    );
  }
}
