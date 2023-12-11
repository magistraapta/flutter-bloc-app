import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/cubit/auth_cubit.dart';
import 'package:movie_app/cubit/product_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:movie_app/pages/auth_page.dart';
import 'package:movie_app/pages/home_page.dart';
import 'package:movie_app/pages/login_page.dart';
import 'package:movie_app/pages/register_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductCubit()..getProducts(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child:  MaterialApp(
        home: AuthPage(),
        routes: {
          '/home-page':(context) => const HomePage(),
          '/register-page':(context) =>  RegisterPage()
        },
      ),
    );
  }
}

