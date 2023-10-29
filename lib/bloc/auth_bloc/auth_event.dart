part of 'auth_bloc.dart';


abstract class AuthEvent {}

class SendOTP extends AuthEvent {
  final String mobileNuber;
  SendOTP({required this.mobileNuber});
}

class CheckOTP extends AuthEvent {
  final String mobileNumber;
  final String otp;
  CheckOTP({required this.mobileNumber, required this.otp});
}
