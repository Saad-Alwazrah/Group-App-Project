import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:june15th/screens/authentication/bloc/auth_bloc.dart';
import 'package:june15th/screens/authentication/login/login_screen.dart';
import 'package:june15th/screens/navbar/nav_bar.dart';
import 'package:june15th/widgets/auth/custom_text.dart';
import 'package:june15th/widgets/auth/submit_button.dart';
import 'package:june15th/widgets/auth/textfields/auth_textfield_confirm_password.dart';
import 'package:june15th/widgets/auth/textfields/auth_textfield_password.dart';
import 'package:june15th/widgets/auth/textfields/auth_textfield_username.dart';
import 'package:june15th/widgets/shared/main_label.dart';
import 'package:june15th/widgets/shared/screen_label.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          final bloc = context.read<AuthBloc>();

          return BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is SuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.green,
                    content: Text("Registration Successful!"),
                  ),
                );
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => NavBar()),
                );
              } else if (state is ErrorState) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Registration Failed")));
              }
            },
            child: Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    SizedBox(height: 32),

                    ScreenLabel(labelText: "Register"),

                    SizedBox(height: 16),
                    Form(
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
            ),
          );
        },
      ),
    );
  }
}
