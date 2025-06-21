part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class RegisterEvent extends AuthEvent {
  late final BuildContext context;
}

class LoginEvent extends AuthEvent {}


