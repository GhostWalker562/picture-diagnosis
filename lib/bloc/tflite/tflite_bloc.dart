import 'dart:async';
import 'dart:io' as Io;
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image/image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:tflite_flutter/tflite_flutter.dart';


part 'tflite_event.dart';
part 'tflite_state.dart';

class TfliteBloc extends Bloc<TfliteEvent, TfliteState> {
  TfliteBloc() : super(TfliteLoading());

  //Interpreter interpreter;

  @override
  Stream<TfliteState> mapEventToState(TfliteEvent event) async* {
    if (event is TfliteLoadModel) {
      yield* _mapLoadModelToState(event);
    }
    if (event is TfliteClassify) {
      yield* _mapClassifyToState(event);
    }
  }

  Stream<TfliteState> _mapLoadModelToState(TfliteLoadModel event) async* {
    yield TfliteLoading();
    try {
      await loadModel(
        model: event.model,
        labels: event.labels,
      );
      
      // interpreter = await Interpreter.fromAsset(event.model);
      print("Loading... " +
          event.model.toString() +
          " " +
          event.labels.toString());
      yield TfliteUnloaded();
    } catch (error) {
      print("Failure");
      yield TfliteUnloaded();
    }
  }

  Stream<TfliteState> _mapClassifyToState(TfliteClassify event) async* {
    yield TfliteLoading();
    try {
      File image = await pickImage();
      List<dynamic> output = await classifyImage(image);
      yield TfliteLoaded(image, output);
    } catch (error) {
      yield TfliteUnloaded();
    }
  }

  loadModel({@required String model, @required String labels}) async {
    await Tflite.loadModel(
      model: model,
      labels: labels,
    );
  }

  pickImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) throw Exception();
    return image;
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      imageStd: 255.0,
      imageMean: 0.0,
    );
    print(output);
    return output;

    // ImageProcessor imageProcessor = ImageProcessorBuilder()
    //     .add(ResizeOp(224, 224, ResizeMethod.NEAREST_NEIGHBOUR))
    //     .build();

    // TensorImage tensorImage = TensorImage.fromFile(image);

    // tensorImage = imageProcessor.process(tensorImage);

    // TensorBuffer probabilityBuffer =
    //     TensorBuffer.createFixedSize(<int>[1, 1001], TfLiteType.uint8);

    // try {
    //   // Create interpreter from asset.
    //   interpreter.run(tensorImage.buffer.asUint8List(), probabilityBuffer.buffer);
    //  print(probabilityBuffer.getDoubleList());
    // } catch (e) {
    //   print('Error loading model: ' + e.toString());
    // }

    
  }
}
