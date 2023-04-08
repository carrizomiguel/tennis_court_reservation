import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_booking/ui/app/app.dart';
import 'package:tennis_booking/ui/shared/shared.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(),
      child: const AppBody(),
    );
  }
}

class AppBody extends StatelessWidget {
  const AppBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: kLightTheme,
      darkTheme: kDarkTheme,
      debugShowCheckedModeBanner: false,
      routerDelegate: AppRouter.routes.routerDelegate,
      routeInformationProvider: AppRouter.routes.routeInformationProvider,
      routeInformationParser: AppRouter.routes.routeInformationParser,
      backButtonDispatcher: AppRouter.routes.backButtonDispatcher,
    );
  }
}
