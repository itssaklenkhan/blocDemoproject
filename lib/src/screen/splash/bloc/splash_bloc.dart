import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashInitEvent>(_onSplashInitEvent);
  }

  FutureOr<void> _onSplashInitEvent(
    SplashEvent event,
    Emitter<SplashState> emit,
  ) async {
    await Future.delayed(const Duration(seconds: 2))
        .whenComplete(() => emit(GoWelcome()));
  }
}
