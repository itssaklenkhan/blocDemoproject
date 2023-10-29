part of 'app_bloc.dart';

abstract class AppEvent {}

class AppInitEvent extends AppEvent {}

class AppLoadingEvent extends AppEvent {}

class InternetLostEvent extends AppEvent {}

class InternetGainEvent extends AppEvent {}


