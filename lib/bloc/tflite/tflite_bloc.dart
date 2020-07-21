import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

part 'tflite_event.dart';
part 'tflite_state.dart';

class TfliteBloc extends Bloc<TfliteEvent,TfliteState> {
  TfliteBloc() : super(TfliteLoading());

  @override
  Stream<TfliteState> mapEventToState(TfliteEvent event) async* {
    if (event is TfliteLoadModel){
      yield * _mapLoadModelToState(event);
    }
    if (event is TfliteClassify){
      yield * _mapClassifyToState(event);
    }
  }

  Stream<TfliteState> _mapLoadModelToState(TfliteLoadModel event ) async*{
    yield TfliteLoading();
    try {
      await loadModel(
        model: event.model,
        labels: event.labels,
      );
      yield TfliteUnloaded();
    } catch (error){
      yield TfliteUnloaded();
    }
  } 

    Stream<TfliteState> _mapClassifyToState(TfliteClassify event ) async*{
    yield TfliteLoading();
    try {
      File image = await pickImage();
      yield TfliteLoaded(image);
    } catch (error){
      yield TfliteUnloaded();
    }
  } 

  loadModel({@required String model, @required String labels}) async {
    await Tflite.loadModel(
      model: model,
      labels: labels,
    );
    print("Model Loaded");
  }

  pickImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) throw Exception();
    classifyImage(image);
    return image;
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    print(output);
  }

}
