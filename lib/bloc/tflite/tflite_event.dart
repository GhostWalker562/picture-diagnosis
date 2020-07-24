part of 'tflite_bloc.dart';


abstract class TfliteEvent {}

class TfliteLoadModel extends TfliteEvent{
  final String model;
  final String labels;

  TfliteLoadModel(this.model, this.labels);
}

class TfliteClassify extends TfliteEvent {
  
}
