
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_app_project/screens/authentication/bloc/auth_bloc.dart';
import 'package:group_app_project/screens/authentication/register/register_screen.dart';
import 'package:group_app_project/widgets/auth/custom_text.dart';
import 'package:group_app_project/widgets/auth/submit_button.dart';
import 'package:group_app_project/widgets/auth/textfields/auth_textfield_password.dart';
import 'package:group_app_project/widgets/auth/textfields/auth_textfield_username.dart';
import 'package:group_app_project/widgets/shared/main_label.dart';
import 'package:group_app_project/widgets/shared/screen_label.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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

                  ScreenLabel(labelText: "Login"),

                  SizedBox(height: 16),

                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return Form(
                        key: bloc.loginformKey,
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
                          ],
                        ),
                      );
                    },
                  ),
                  CustomText(
                    firstText: "Don't have an account? ",
                    secondText: " Reigster",
                    destination: RegisterScreen(),
                  ),

                  Spacer(),
                  SubmitButton(
                    buttonLabel: "Login",
                    pressedFunction: () {
                      bloc.add(LoginEvent());
                    },
                    isEnabled: bloc.isEnabledButton,
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
