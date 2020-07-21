part of 'navigation_bloc.dart';

@immutable
abstract class NavigationState {}

class NavigationInitial extends NavigationState {}

class NavigationSuccess extends NavigationState {
  final int page;

  NavigationSuccess(this.page);
}

class NavigationLoading extends NavigationState {}

class NavigationFailure extends NavigationState {}
