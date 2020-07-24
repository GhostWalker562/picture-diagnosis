import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:picture_diagnosis/bloc/navigation/navigation_bloc.dart';
import 'package:picture_diagnosis/core/sizeconfig.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Hotbar extends StatelessWidget {
  const Hotbar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Color(0xFFADD9F4),blurRadius: 10)],
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
      child: Stack(
        children: [
          Positioned(
            child: Container(
            
              width: Sc.blockSizeHorizontal * 6,
              height: 2,
              color: Colors.white,
            ),
            bottom: 5, //11 29.5
            left: Sc.blockSizeHorizontal * (45-6),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(FontAwesomeIcons.allergies),
                onPressed: ()=> BlocProvider.of<NavigationBloc>(context).add(RequestNavigate(0)),
              ),
              IconButton(
                icon: Icon(FontAwesomeIcons.lungs),
                onPressed: ()=> BlocProvider.of<NavigationBloc>(context).add(RequestNavigate(1)),
              ),
              // IconButton(
              //   icon: Icon(AntDesign.hourglass),
              //   onPressed: ()=> BlocProvider.of<NavigationBloc>(context).add(RequestNavigate(2)),
              // ),
              // IconButton(
              //   icon: Icon(AntDesign.skin),
              //   onPressed: ()=> BlocProvider.of<NavigationBloc>(context).add(RequestNavigate(3)),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
