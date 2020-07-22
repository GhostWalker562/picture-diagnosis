part of 'tflite_bloc.dart';

@immutable
abstract class TfliteState {}

class TfliteInitial extends TfliteState {}

// Set when no image is loaded
class TfliteUnloaded extends TfliteState {}

// Set when image is loaded
class TfliteLoaded extends TfliteState {
  final File image;
  final List<dynamic> output;

  TfliteLoaded(this.image, this.output);

}

class TfliteLoading extends TfliteState {}