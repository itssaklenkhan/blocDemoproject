import 'package:bloc_demo/src/screen/login/login_view.dart';
import 'package:bloc_demo/src/screen/signup/signup_view.dart';
import 'package:bloc_demo/src/screen/splash/splash_view.dart';
import 'package:bloc_demo/src/screen/welcome/welcome_view.dart';
import 'package:go_router/go_router.dart';

///Routes Name
///Add new screen here with there path neme
const String splashView = "/";
const String welcomeView = "/welcome";
const String loginView = "/login";
const String signupView = "/signup";

final GoRouter router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: splashView,
      builder: (context, state) {
        return const SplashView();
      },
    ),
    GoRoute(
      path: welcomeView,
      name: welcomeView,
      builder: (context, state) {
        return const WelcomeView();
      },
    ),
    GoRoute(
      path: loginView,
      name: loginView,
      builder: (context, state) {
        return LoginView();
      },
    ),
    GoRoute(
      path: signupView,
      name: signupView,
      builder: (context, state) {
        return const SignupView();
      },
    ),
  ],
);

class AppRoutes{

 static const String splashView = "/";
 static const String welcomeView = "/welcome";
 static const String loginView = "/login";
 static const String signupView = "/signup";


  static final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: splashView,
        builder: (context, state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: welcomeView,
        name: welcomeView,
        builder: (context, state) {
          return const WelcomeView();
        },
      ),
      GoRoute(
        path: loginView,
        name: loginView,
        builder: (context, state) {
          return LoginView();
        },
      ),
      GoRoute(
        path: signupView,
        name: signupView,
        builder: (context, state) {
          return const SignupView();
        },
      ),
    ],
  );

}