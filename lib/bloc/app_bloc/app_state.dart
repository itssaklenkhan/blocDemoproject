part of 'app_bloc.dart';

abstract class AppState {}

class AppInit extends AppState {}

class AppLoaded extends AppState {}

class UnAuthenticated extends AppState {}

class TokenExpired extends AppState {}

class LoadDefaults extends AppState {}

class InternetLostState extends AppState {}
