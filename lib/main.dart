import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafa2a/config/app_theme.dart';
import 'package:kafa2a/config/routes_manager.dart';
import 'package:kafa2a/core/app_bloc_observer.dart';
import 'package:kafa2a/core/di/service_locator.dart';
import 'package:kafa2a/features/auth/presentation/cubit/auth_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await configureDependencies();
  runApp(const Kafa2aApp());
}

class Kafa2aApp extends StatelessWidget {
  const Kafa2aApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt.get<AuthCubit>(),
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        builder: (context, child) => MaterialApp(
          initialRoute: RoutesManager.onBoarding,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RoutesManager.router,
          theme: AppTheme.lightTheme,
        ),
      ),
    );
  }
}
