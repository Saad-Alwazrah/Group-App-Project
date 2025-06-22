import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:june15th/repositories/api/supabase_connect.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  bool usernameIndicator = false;
  bool passIndicator = false;
  bool confirmPassIndicator = false;

  bool isEnabledButton = false;
  bool authSuccess = false;

  final registerformKey = GlobalKey<FormState>();
  final loginformKey = GlobalKey<FormState>();
  final supabase = GetIt.I.get<SupabaseConnect>();

  TextEditingController? usernameController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  TextEditingController? passwordConfrirmController = TextEditingController();

  AuthBloc() : super(AuthInitial()) {
    on<RegisterEvent>(registerValidationMethod);
    on<LoginEvent>(loginValidationMethod);
  }

  FutureOr<void> registerValidationMethod(
    RegisterEvent event,
    Emitter<AuthState> emit,
  ) async {
    if (registerformKey.currentState!.validate()) {
      log("Register validation is successful");
      final authSuccess = await supabase.signUpNewUser(
        username: usernameController!.text.trim(),
        password: passwordController!.text.trim(),
      );
      clearControllers();
      if (authSuccess) {
        emit(SuccessState());
      } else {
        log("Register validation Failed");
        emit(ErrorState());
      }
    } else {
      log("Register validation Failed");
      authSuccess = false;
      emit(ErrorState());
    }
  }

  FutureOr<void> loginValidationMethod(
    LoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    if (loginformKey.currentState!.validate()) {
      log("login validation is successful");
      final authSuccess = await supabase.signInWithUsername(
        username: usernameController!.text.trim(),
        password: passwordController!.text.trim(),
      );
      clearControllers();
      if (authSuccess) {
        emit(SuccessState());
      } else {
        log("Login validation Failed");
        emit(ErrorState());
      }
    } else {
      log("login validation Failed");
      authSuccess = false;
      emit(ErrorState());
    }
  }

  String? usernameValidation({String? text}) {
    log("Here is username validation");
    if (text == null || text.isEmpty) {
      usernameIndicator = false;
      return "This field is required";
    } else if (text.length < 4) {
      usernameIndicator = false;
      return "Username must atleast have a length of 5";
    } else {
      usernameIndicator = true;
      updateButtonStatus();
      log("usernameIndicator is true ");

      return null;
    }
  }

  String? passwordValidation({String? text}) {
    if (text == null || text.isEmpty) {
      passIndicator = false;
      return "This field is required";
    } else if (text.length < 5) {
      passIndicator = false;
      return "Password must be atleast have a length of 6";
    } else {
      passIndicator = true;
      updateButtonStatus();
      log("passIndicator is true");
      return null;
    }
  }

  String? confirmPasswordValidation({String? text}) {
    if (text == null || text.isEmpty) {
      confirmPassIndicator = false;
      return "This field is required";
    } else if (text != passwordController!.text) {
      confirmPassIndicator = false;
      return "The passwords don't match";
    } else {
      confirmPassIndicator = true;
      updateButtonStatus();
      log("confirmPassIndicator is true");
      return null;
    }
  }

  void updateButtonStatus() {
    log("Updating UI");

    if (usernameIndicator && passIndicator) {
      isEnabledButton = true;
      emit(UpdateState());
      return;
    } else {
      isEnabledButton = false;
      emit(UpdateState());
      return;
    }
  }

  clearControllers() {
    usernameController!.clear();
    passwordController!.clear();
    passwordConfrirmController!.clear();
  }
}
