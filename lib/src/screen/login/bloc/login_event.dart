part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginInitEvent extends LoginEvent {}

class GetOtpEvent extends LoginEvent {}

class LoginTapEvent extends LoginEvent {}

class SignUpTapEvent extends LoginEvent {}
