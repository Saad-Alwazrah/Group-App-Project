import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_app_project/screens/authentication/bloc/auth_bloc.dart';
import 'package:group_app_project/screens/authentication/login/login_screen.dart';
import 'package:group_app_project/widgets/auth/custom_text.dart';
import 'package:group_app_project/widgets/auth/submit_button.dart';
import 'package:group_app_project/widgets/auth/textfields/auth_textfield_confirm_password.dart';
import 'package:group_app_project/widgets/auth/textfields/auth_textfield_password.dart';
import 'package:group_app_project/widgets/auth/textfields/auth_textfield_username.dart';
import 'package:group_app_project/widgets/shared/main_label.dart';
import 'package:group_app_project/widgets/shared/screen_label.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<AuthBloc>();
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 32),

                  ScreenLabel(labelText: "Register"),

                  SizedBox(height: 16),

                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return Form(
                        key: bloc.registerformKey,
                        child: Column(
                          children: [
                            MainLabel(labelText: "Username"),
                            AuthTextFieldUsername(
                              controller: bloc.usernameController!,
                              textFieldHintText: "Enter Username",
                              validationMethod: (value) {
                                return bloc.usernameValidation(text: value);
                              },
                            ),

                            MainLabel(labelText: "Password"),
                            AuthTextFieldPassword(
                              controller: bloc.passwordController!,
                              textFieldHintText: "Enter Password",
                              validationMethod: (value) {
                                return bloc.passwordValidation(text: value);
                              },
                            ),

                            MainLabel(labelText: "Confirm Password"),
                            AuthTextFieldConfirmPassword(
                              controller: bloc.passwordConfrirmController!,
                              textFieldHintText: "Repeat password",
                              validationMethod: (value) {
                                return bloc.confirmPasswordValidation(
                                  text: value,
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  SizedBox(height: 16),
                  CustomText(
                    firstText: "Already have an account",
                    secondText: "Login",
                    destination: LoginScreen(),
                  ),

                  Spacer(),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return SubmitButton(
                        buttonLabel: "Register",
                        pressedFunction: () {
                          bloc.add(RegisterEvent());
                        },
                        isEnabled: bloc.isEnabledButton,
                      );
                    },
                  ),

                  SizedBox(height: 64),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
