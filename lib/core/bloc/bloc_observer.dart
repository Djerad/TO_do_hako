import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Myblocobserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    if (kDebugMode) {
      print('on create  ${bloc.runtimeType}');
    }
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    // TODO: implement onChange
    super.onChange(bloc, change);
    if (kDebugMode) {
      print('onchange  ${bloc.runtimeType}  ,$change ');
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(bloc, error, stackTrace);
    if (kDebugMode) {
      print('  onerror  ${bloc.runtimeType}, ${error}      ,  }');
    }
  }
}
