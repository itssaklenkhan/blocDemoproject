import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_event.dart';

part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  int totalPage = 8;

  SignupBloc() : super(SignupInitial()) {
    on<SignupInitEvent>(_onSignupInitEvent);
    on<GoNextPageEvent>(_onGoNextPageEvent);
    on<ClickOnLoginEvent>(_onClickOnLoginEvent);
    on<GoPreviousPageEvent>(_onGoPreviousPageEvent);
  }

  FutureOr<void> _onSignupInitEvent(
    SignupInitEvent event,
    Emitter<SignupState> emit,
  ) {
    emit(
      SignupLoaded(
        pageIndex: 0,
        textEditingController: TextEditingController(),
        pageController: PageController(),
        progress: 0,
        forLookingList: const []
      ),
    );
  }

  FutureOr<void> _onGoNextPageEvent(
    GoNextPageEvent event,
    Emitter<SignupState> emit,
  ) {
    final last = state as SignupLoaded;
    if (last.pageIndex == totalPage - 1) {

      debugPrint('______ ${last.pageIndex}');
    } else {
      final newState = last.copyWith(
        pageIndex: last.pageIndex + 1,
        progress: last.progress + 0.12,
      );
      emit(newState);
    }
  }

  FutureOr<void> _onClickOnLoginEvent(
    ClickOnLoginEvent event,
    Emitter<SignupState> emit,
  ) {
    emit(GoLoginState());
  }

  FutureOr<void> _onGoPreviousPageEvent(
    GoPreviousPageEvent event,
    Emitter<SignupState> emit,
  ) {
    final last = state as SignupLoaded;
    final newState = last.copyWith(
      pageIndex: last.pageIndex - 1,
      progress: last.progress - 0.12,
    );
    emit(newState);
  }
}
