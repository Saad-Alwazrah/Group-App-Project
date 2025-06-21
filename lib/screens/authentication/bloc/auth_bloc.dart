import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:coffee_enjoyer/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

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
  ) {
    if (registerformKey.currentState!.validate() == true) {
      log("Register validation is successful");
      clearControllers;
      authSuccess = true;
      emit(SuccessState(authStatus: authSuccess));
    } else {
      log("Register validation Failed");
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
    if (usernameIndicator && passIndicator && confirmPassIndicator) {
      isEnabledButton = true;
      emit(UpdateState());
      return;
    } else {
      isEnabledButton = false;
      emit(UpdateState());
      return;
    }
  }

  FutureOr<void> loginValidationMethod(
    LoginEvent event,
    Emitter<AuthState> emit,
  ) {
    if (loginformKey.currentState!.validate() == true) {
      log("login validation is successful");
      authSuccess = true;
      emit(SuccessState(authStatus: authSuccess));
    } else {
      log("login validation Failed");
      authSuccess = false;
      emit(ErrorState());
    }
  }

  clearControllers() {
    usernameController!.clear();
    passwordController!.clear();
    passwordConfrirmController!.clear();
  }
}
