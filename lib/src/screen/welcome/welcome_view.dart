import 'package:bloc_demo/app_route/app_router.dart';
import 'package:bloc_demo/src/screen/welcome/bloc/welcome_bloc.dart';
import 'package:bloc_demo/src/utils/extension/space.dart';
import 'package:bloc_demo/src/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => WelcomeBloc(),
          child: BlocConsumer<WelcomeBloc, WelcomeState>(
            listener: (context, state) {
              if (state is LoadSignupState) {
                context.pushNamed(signupView);
              }
              if (state is LoadLoginState) {
                context.pushNamed(loginView);
              }
            },
            builder: (context, state) {
              return Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppTextButton(
                      onPressed: () {
                        BlocProvider.of<WelcomeBloc>(context).add(LoginEvent());
                      },
                      text: "Login",
                    ),
                    10.toSpace(),
                    20.toSpace(horizontally: false),
                    AppTextButton(
                      onPressed: () {
                        BlocProvider.of<WelcomeBloc>(context).add(SignUpEvent());
                      },
                      text: "SignUp",
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
