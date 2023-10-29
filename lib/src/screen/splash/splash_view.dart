import 'package:bloc_demo/app_route/app_router.dart';
import 'package:bloc_demo/bloc/app_bloc/app_bloc.dart';
import 'package:bloc_demo/src/screen/splash/bloc/splash_bloc.dart';
import 'package:bloc_demo/src/utils/extension/text_style_extension.dart';
import 'package:bloc_demo/src/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider<AppBloc>(
            create: (context) => AppBloc()..add(AppInitEvent()),
          ),
        ],
        child: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            if (state is AppLoaded) {
              return BlocProvider<SplashBloc>(
                create: (context) => SplashBloc()..add(SplashInitEvent()),
                child: BlocConsumer<SplashBloc, SplashState>(
                  listener: (context, state) {
                    if (state is GoWelcome) {
                      context.replaceNamed(welcomeView);
                    }
                  },
                  builder: (context, state) {
                    return Center(
                      child: Text(
                        "Splash Screen",
                        style: const TextStyle().bold,
                      ),
                    );
                  },
                ),
              );
            } else if (state is InternetLostState) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.wifi_off,
                      size: 50,
                    ),
                    Text(
                      "Please check youe internet connection",
                      style: const TextStyle().bold,
                    ),
                  ],
                ),
              );
            } else {
              return ErrorWidgetView(errorMsg: state.toString());
            }
          },
        ),
      ),
    );
  }
}
