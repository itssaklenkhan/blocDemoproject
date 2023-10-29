import 'package:bloc_demo/app_route/app_router.dart';
import 'package:bloc_demo/src/utils/app_colors.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {


  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(

      routeInformationProvider: AppRoutes.router.routeInformationProvider,
      routeInformationParser: AppRoutes.router.routeInformationParser,
      routerDelegate: AppRoutes.router.routerDelegate,
       // routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'Check Mate',
      theme: ThemeData(
        primaryColor: secondaryColor,
      ),
    );
  }
}
