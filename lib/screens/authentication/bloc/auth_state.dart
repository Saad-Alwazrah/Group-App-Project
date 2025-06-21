part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class SuccessState extends AuthState {
 final bool authStatus;

  SuccessState({required this.authStatus});}

class ErrorState extends AuthState {}

class UpdateState extends AuthState {}