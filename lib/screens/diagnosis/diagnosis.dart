import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picture_diagnosis/core/sizeconfig.dart';
import 'package:picture_diagnosis/screens/diagnosis/components/hotbar.dart';

class DiagnosisPage extends StatelessWidget {
  const DiagnosisPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF101419),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
                child: Container(
              
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
                            border:
                                Border.all(color: Color(0xFFADD9F4), width: 3)),
                        height: Sc.blockSizeVertical * 10,
                        width: Sc.blockSizeVertical * 10,
                      ),
                      Container(
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                            color: Color(0xFF476C9B),
                            border:
                                Border.all(color: Color(0xFFADD9F4), width: 3)),
                     
                        height: Sc.blockSizeVertical * 10,
                        width: Sc.blockSizeVertical * 40,
                      ),
                    ],
                  )
                ],
              ),
            )),
            Hotbar(),
          ],
        ),
      ),
    );
  }
}
