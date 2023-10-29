import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final TextEditingController phoneController = TextEditingController();

  LoginBloc() : super(LoginInitial()) {
    on<LoginInitEvent>(_onLoginInitEvent);
    on<GetOtpEvent>(_onGetOtpEvent);
    on<LoginTapEvent>(_onLoginTapEvent);
    on<SignUpTapEvent>(_onSignUpTapEvent);
  }

  FutureOr<void> _onLoginInitEvent(
      LoginInitEvent event, Emitter<LoginState> emit) {
    emit(LoginLoaded(phoneCtrl: TextEditingController()));
  }

  FutureOr<void> _onGetOtpEvent(
    GetOtpEvent event,
    Emitter<LoginState> emit,
  ) async {
    final last = state as LoginLoaded;
    emit(last.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 2)).whenComplete(
      () => emit(last.copyWith(isLoading: false)),
    );
  }

  FutureOr<void> _onLoginTapEvent(
    LoginTapEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(LoginDone());
  }

  FutureOr<void> _onSignUpTapEvent(
    SignUpTapEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(GoSignUpState());
  }
}
