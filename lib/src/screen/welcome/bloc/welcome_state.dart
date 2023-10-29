part of 'welcome_bloc.dart';

@immutable
abstract class WelcomeState {}

class LandingInitial extends WelcomeState {}

class LoadSignupState extends WelcomeState {}

class LoadLoginState extends WelcomeState {}
