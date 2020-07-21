import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationInitial());

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if ( event is NavigateTo){
      yield NavigationSuccess(event.page);
    }
  }

  // Stream<NavigationState> _mapRequestState(NavigateTo event) async* {
  //   yield NavigationLoading();
  //   try {
      
  //     yield NavigationSuccess();
  //   } catch (error) {
      
  //     yield NavigationFailure();
  //   } 
  // }
}
