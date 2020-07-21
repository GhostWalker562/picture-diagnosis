part of 'tflite_bloc.dart';

@immutable
abstract class TfliteEvent {}

class TfliteLoadModel extends TfliteEvent{
  final String model;
  final String labels;

  TfliteLoadModel(this.model, this.labels);
}

class TfliteClassify extends TfliteEvent {
  
}
