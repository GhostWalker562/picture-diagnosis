import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picture_diagnosis/bloc/navigation/navigation_bloc.dart';
import 'package:picture_diagnosis/bloc/tflite/tflite_bloc.dart';
import 'package:picture_diagnosis/core/sizeconfig.dart';
import 'package:picture_diagnosis/screens/diagnosis/components/pagecomponents/topbar.dart';


class CancerPage extends StatefulWidget {
  const CancerPage({Key key}) : super(key: key);

  @override
  _CancerPageState createState() => _CancerPageState();
}

class _CancerPageState extends State<CancerPage> with TickerProviderStateMixin {
  AnimationController anim;
  Animation fadeOut;

  @override
  void initState() {
    BlocProvider.of<TfliteBloc>(context).add(TfliteLoadModel(
        "assets/melanoma/model_unquant.tflite", "assets/melanoma/labels.txt"));
    anim = AnimationController(
        vsync: this, duration: Duration(milliseconds: 250));
    fadeOut = anim.drive(Tween<double>(begin: 1, end: 0));
    super.initState();
  }

  @override
  void dispose() {
    anim.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: Sc.blockSizeHorizontal * 5,
          vertical: Sc.blockSizeVertical),
      child: Column(
        children: [
          TopBar(),
          Expanded(
            child: BlocListener<NavigationBloc, NavigationState>(
              listener: (BuildContext context, state) {
                if (state is Navigating) {
                  if (state.page != 0) {
                    anim.forward();
                    anim.addStatusListener((AnimationStatus status) {
                      if (status == AnimationStatus.completed) {
                  
                        BlocProvider.of<NavigationBloc>(context)
                            .add(NavigateTo(state.page));
                      }
                    });
                  }
                }
              },
              child: AnimatedBuilder(
                child: BlocBuilder<TfliteBloc, TfliteState>(
                    builder: (context, state) {
                  if (state is TfliteLoading) {
                    // THIS IS THE OUTPUT FOR LOADING

                    // EDITS PAST HERE ARE GOOD
                    return Center(
                        child: SpinKitWave(color:Colors.white));
                  }
                  if (state is TfliteUnloaded) {
                    // THIS IS THE OUTPUT FOR WHEN AN IMAGE IS NOT SELECTED/

                    // EDITS PAST HERE ARE GOOD
                    return Container(
                        child: Center(
                            child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "Artifical Insight : ",
                                style: GoogleFonts.vollkorn(
                                   fontSize: 24, color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: "Melanoma",
                                style: GoogleFonts.vollkorn(
                                   fontSize: 24, color: Color(0xFF468C98),
                                    fontWeight: FontWeight.bold)),
                          ]),
                        ),
                        Text(
                          "Select an image in the top left.",
                          style: GoogleFonts.vollkorn(fontSize: 24,color: Colors.white),
                        ),
                      ],
                    )));
                  }
                  if (state is TfliteLoaded) {
                     // THIS IS THE OUTPUT FOR WHEN AN IMAGE IS SELECTED//
                    // EDITS PAST HERE ARE GOOD
                    return Container(
                        child: Center(child: FadeInUp(child: Image.file(state.image),from: 10,),));
                  }
                  return Container(width:0,height:0);
                }),
                animation: fadeOut,
                builder: (BuildContext context, Widget child) {
                  return Opacity(
                    opacity: fadeOut.value,
                    child: child,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
