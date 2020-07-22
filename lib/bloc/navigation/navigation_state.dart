part of 'navigation_bloc.dart';

@immutable
abstract class NavigationState {}

class NavigationInitial extends NavigationState {}

class NavigationSuccess extends NavigationState {
  final int page;

  NavigationSuccess(this.page);
}

class Navigating extends NavigationState {
  final int page;
  Navigating(this.page);
  
}

class NavigationLoading extends NavigationState {}

class NavigationFailure extends NavigationState {}
