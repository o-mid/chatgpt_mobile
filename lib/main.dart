import 'dart:io';

import 'package:chatgpt_mobile/features/app/routes/on_generate_route.dart';
import 'package:chatgpt_mobile/server/http_certificate_maneger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/app/home/home_page.dart';
import 'features/app/splash/splash_screen.dart';
import 'features/image_generation/presentation/cubit/image_generation_cubit.dart';
import 'features/text_completion/presentation/cubit/text_completion_cubit.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = new MyHttpOverrides();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TextCompletionCubit>(
          create: (_) => di.sl<TextCompletionCubit>(),
        ),
        BlocProvider<ImageGenerationCubit>(
          create: (_) => di.sl<ImageGenerationCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ChatGPT',
        onGenerateRoute: OnGenerateRoute.route,
        theme: ThemeData(brightness: Brightness.dark),
        initialRoute: '/',
        routes: {
          "/": (context) {
            return const SplashScreen(
              child: HomePage(),
            );
          }
        },
      ),
    );
  }
}
