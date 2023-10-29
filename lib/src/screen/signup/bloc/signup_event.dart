part of 'signup_bloc.dart';


abstract class SignupEvent {}

class SignupInitEvent extends SignupEvent {}

class GoNextPageEvent extends SignupEvent{}

class GoPreviousPageEvent extends SignupEvent{}

class ClickOnLoginEvent extends SignupEvent {}


