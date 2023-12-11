import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/cubit/auth_cubit.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Register with Email',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 24,
              ),
              Column(
                children: [
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Email here...'),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Password here...'),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      // TODO: implement listener
                      if (state is AuthSuccess) {
                        Navigator.popAndPushNamed(context, '/home-page');
                      }
                    },
                    builder: (context, state) {
                      return ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<AuthCubit>(context).createUser(
                                emailController.text.trim(),
                                passwordController.text.trim());
                          },
                          child: Text(state is AuthLoading
                              ? 'Loading...'
                              : 'Create user'));
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
