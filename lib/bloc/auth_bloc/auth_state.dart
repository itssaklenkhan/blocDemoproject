part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class OtpSendingStatus extends AuthState {
  final bool hasError;
  final String? message;
  OtpSendingStatus({required this.hasError, this.message});
}


