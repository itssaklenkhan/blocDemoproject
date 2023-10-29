import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final Connectivity _connectivity = Connectivity();

  AppBloc() : super(AppInit()) {
    on<AppInitEvent>(_onAppInitEvent);
    on<InternetLostEvent>((event, emit) => emit(InternetLostState()));
    on<InternetGainEvent>((event, emit) => emit(AppLoaded()));

    _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile ||
          event == ConnectivityResult.wifi) {
        add(InternetGainEvent());
      } else {
        add(InternetLostEvent());
      }
    });
  }

   FutureOr<void> _onAppInitEvent(
    AppInitEvent event,
    Emitter<AppState> emit,
  ) async {
    final result = await _connectivity.checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      emit(AppLoaded());
    } else {
      emit(InternetLostState());
    }
  }


}
