part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoaded extends LoginState {
  final bool? isLoading;
  final TextEditingController phoneCtrl;

  LoginLoaded({
    required this.phoneCtrl,
    this.isLoading,
  }) : super() {
    isLoading ?? false;
  }

  LoginLoaded copyWith({
    bool? isLoading,
    TextEditingController? phoneCtrl,
  }) =>
      LoginLoaded(
        phoneCtrl: phoneCtrl ?? this.phoneCtrl,
        isLoading: isLoading ?? this.isLoading,
      );
}

class LoginDone extends LoginState {}

class GoSignUpState extends LoginState {}

class LoginError extends LoginState {
  final String message;

  LoginError({required this.message});

  @override
  String toString() => 'HomePageStateError';
}
