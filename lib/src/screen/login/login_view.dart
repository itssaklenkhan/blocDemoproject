import 'package:bloc_demo/app_route/app_router.dart';
import 'package:bloc_demo/src/screen/login/bloc/login_bloc.dart';
import 'package:bloc_demo/src/utils/app_colors.dart';
import 'package:bloc_demo/src/utils/extension/space.dart';
import 'package:bloc_demo/src/utils/extension/text_field_decorection_extension.dart';
import 'package:bloc_demo/src/utils/extension/text_style_extension.dart';
import 'package:bloc_demo/src/widgets/app_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocProvider(
          create: (context) => LoginBloc()..add(LoginInitEvent()),
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginDone) {
                // go home page
              }
              if (state is GoSignUpState) {
                context.replaceNamed(signupView);
              }
            },
            builder: (context, state) {
              if (state is LoginLoaded) {
                return _view(context, state);
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _view(BuildContext context, LoginLoaded state) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.toSpace(),
          Text(
            'Log in',
            style: const TextStyle().bold.copyWith(fontSize: 30),
          ),
          const SizedBox(height: 100),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: state.phoneCtrl,
                  decoration: const InputDecoration().txtFieldStyle(
                    hintText: '+91',
                    labelName: '',
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 12,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration().txtFieldStyle(
                      hintText: 'Enter your phone number', labelName: ''),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          state.isLoading ?? false
              ? Center(child: CircularProgressIndicator(color: purpleColor))
              : Container(
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.only(right: 10),
                  child: AppButton(
                    name: 'Get OTP',
                    onPressed: () {
                      BlocProvider.of<LoginBloc>(context).add(GetOtpEvent());
                    },
                    textSize: 20,
                    hPadding: 40,
                    vPadding: 10,
                  ),
                ),
          const SizedBox(height: 40),
          Text(
            'Enter OTP',
            style: const TextStyle().bold,
          ),
          const SizedBox(height: 10),
          PinCodeTextField(
            appContext: context,
            length: 4,
            obscureText: false,
            animationType: AnimationType.fade,
            hintCharacter: '-',
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              selectedColor: txtFieldColor,
              borderRadius: BorderRadius.circular(10),
              selectedFillColor: txtFieldColor,
              activeColor: txtFieldColor,
              activeFillColor: txtFieldColor,
              inactiveColor: txtFieldColor,
              inactiveFillColor: txtFieldColor,
              fieldOuterPadding: const EdgeInsets.only(right: 15),
              fieldWidth: 60,
              fieldHeight: 60,
            ),
            animationDuration: const Duration(milliseconds: 300),
            // backgroundColor: txtFieldColor,
            enableActiveFill: true,

            keyboardType: TextInputType.number,
            textStyle: const TextStyle().bold.copyWith(fontSize: 30),
            onCompleted: (v) {
              if (kDebugMode) {
                print('Completed');
              }
            },
            onChanged: (value) {
              // setState(() {
              //   currentText = value;
              // });
            },
            beforeTextPaste: (text) {
              if (kDebugMode) {
                print('Allowing to paste $text');
              }
              return true;
            },
          ),
          const SizedBox(height: 20),
          Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(right: 10),
            child: AppButton(
              name: 'Login',
              onPressed: () {},
              textSize: 20,
              hPadding: 50,
              vPadding: 10,
            ),
          ),
          const SizedBox(height: 50),
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () => BlocProvider.of<LoginBloc>(context).add(
                SignUpTapEvent(),
              ),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Don’t have account?',
                      style: const TextStyle().medium.copyWith(),
                    ),
                    TextSpan(
                      text: ' Sign UP',
                      style: const TextStyle().bold.copyWith(),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
