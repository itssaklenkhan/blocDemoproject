part of 'welcome_bloc.dart';

@immutable
abstract class WelcomeEvent {}

class SignUpEvent extends WelcomeEvent {}

class LoginEvent extends WelcomeEvent {}

