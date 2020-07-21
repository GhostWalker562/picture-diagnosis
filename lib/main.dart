import 'package:flutter/material.dart';
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
      title: 'Flutter Demo',
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
    return DiagnosisPage();
  }
}