import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:particles_flutter/particles_flutter.dart';

import 'package:picture_diagnosis/bloc/navigation/navigation_bloc.dart';
import 'package:picture_diagnosis/core/sizeconfig.dart';

import 'package:picture_diagnosis/screens/diagnosis/components/cancer.dart';
import 'package:picture_diagnosis/screens/diagnosis/components/hotbar.dart';
import 'package:picture_diagnosis/screens/diagnosis/components/xray.dart';

class DiagnosisPage extends StatefulWidget {
  const DiagnosisPage({Key key}) : super(key: key);

  @override
  _DiagnosisPageState createState() => _DiagnosisPageState();
}

class _DiagnosisPageState extends State<DiagnosisPage> {

  int currentpage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF101419),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/melanoma/backgroundChoice1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
                  child: Stack(
            children: [

              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(child: BlocBuilder<NavigationBloc, NavigationState>(
                      builder: (context, state) {
                    if (state is NavigationSuccess) {
                      if (state.page == 0){currentpage = 0;return CancerPage();}
                      if (state.page == 1){currentpage = 1;return XrayPage(); }
                      
                      return CancerPage(); 
                    } 
                    if (state is Navigating){
                      if (currentpage == 0){return CancerPage();}
                      if (currentpage == 1){return XrayPage();}
                      return CancerPage();
                    }
                    return CancerPage();
                  })),
                  Hotbar(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
