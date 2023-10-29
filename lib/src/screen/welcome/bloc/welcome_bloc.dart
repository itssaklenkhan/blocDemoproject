import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'welcome_event.dart';
part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(LandingInitial()){
    on<LoginEvent>(_onLoginEvent);
    on<SignUpEvent>(_onSignUpEvent);
  }

  FutureOr<void> _onLoginEvent(LoginEvent event, Emitter<WelcomeState> emit) {
    emit(LoadLoginState());
  }

  FutureOr<void> _onSignUpEvent(SignUpEvent event, Emitter<WelcomeState> emit) {
    emit(LoadSignupState());
  }
}
