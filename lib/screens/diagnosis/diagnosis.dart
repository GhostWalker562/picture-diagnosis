import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picture_diagnosis/bloc/navigation/navigation_bloc.dart';
import 'package:picture_diagnosis/core/sizeconfig.dart';
import 'package:picture_diagnosis/screens/diagnosis/components/cancer.dart';
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
            Expanded(child: BlocBuilder<NavigationBloc, NavigationState>(
                builder: (context, state) {
              if (state is NavigationSuccess) {
                return CancerPage();
              } else {
                return CancerPage(); 
              }
            })),
            Hotbar(),
          ],
        ),
      ),
    );
  }
}
