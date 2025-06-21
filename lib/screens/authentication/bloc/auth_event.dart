part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class RegisterEvent extends AuthEvent {}

class LoginEvent extends AuthEvent {}
