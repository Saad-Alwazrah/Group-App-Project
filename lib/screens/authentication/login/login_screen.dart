import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:june15th/screens/authentication/bloc/auth_bloc.dart';
import 'package:june15th/screens/authentication/register/register_screen.dart';
import 'package:june15th/screens/navbar/nav_bar.dart';
import 'package:june15th/styles/app_colors.dart';
import 'package:june15th/widgets/auth/custom_text.dart';
import 'package:june15th/widgets/auth/submit_button.dart';
import 'package:june15th/widgets/auth/textfields/auth_textfield_password.dart';
import 'package:june15th/widgets/auth/textfields/auth_textfield_username.dart';
import 'package:june15th/widgets/shared/main_label.dart';
import 'package:june15th/widgets/shared/screen_label.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is SuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: AppColors.primaryFilledColor,
                content: Text("Login Successful!"),
              ),
            );
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => NavBar()),
            );
          } else if (state is ErrorState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("Login Failed:")));
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            final bloc = context.read<AuthBloc>();

            return Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    SizedBox(height: 32),

                    ScreenLabel(labelText: "Login"),

                    SizedBox(height: 16),

                    Form(
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
      ),
    );
  }
}
