import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picture_diagnosis/bloc/tflite/tflite_bloc.dart';
import 'package:picture_diagnosis/bloc/navigation/navigation_bloc.dart';
import 'package:picture_diagnosis/core/sizeconfig.dart';
import 'package:picture_diagnosis/core/theme.dart';
import 'package:picture_diagnosis/screens/diagnosis/diagnosis.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Artificial Insight',
      theme: theme,
      home: SizeConfig(),
    );
  }
}

// Edit stuff past here.
class SizeConfig extends StatelessWidget {
  const SizeConfig({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Sc().init(context);
    return MultiBlocProvider(providers: [
      BlocProvider<NavigationBloc>(
      create: (BuildContext context) => NavigationBloc(),
    ),
    BlocProvider<TfliteBloc>(
      create: (BuildContext context) => TfliteBloc(),
    ),
    ],
    child: DiagnosisPage());
  }
}