import 'dart:async';

import 'package:memodio/screens/splash_service/block/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(InitialSplashState()) {
    splashServices();
  }
  splashServices() {
    Timer(const Duration(seconds: 3), () {
      emit(SplashCompliteSplashState());
    });
  }
}
