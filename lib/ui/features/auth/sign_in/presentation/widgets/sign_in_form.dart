import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_booking/ui/features/auth/auth.dart';
import 'package:tennis_booking/ui/shared/shared.dart';

class SignInForm extends StatelessWidget {
  SignInForm({super.key});

  final emailController = TextEditingController(text: 'jhondoe@gmail.com');
  final passwordController = TextEditingController(text: '123456');

  @override
  Widget build(BuildContext context) {
    final signInBloc = context.read<SignInBloc>();

    return Column(
      children: [
        DefaultTextField(
          label: 'Email Address',
          controller: emailController,
        ),
        const SizedBox(height: 15),
        PasswordTextField(
          controller: passwordController,
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            const DefaultCheckbox(
              label: 'Remember Me',
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'Forgot Password',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        SizedBox(
          width: double.infinity,
          child: BlocSelector<SignInBloc, SignInState, SignInStatus>(
            selector: (state) => state.status,
            builder: (context, state) {
              return ElevatedButton(
                onPressed: () {
                  signInBloc.add(
                    SignInSubmitted(
                      email: emailController.text,
                      password: passwordController.text,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: state == SignInStatus.loading
                    ? const SizedBox(
                        width: 15,
                        height: 15,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : const Text('Login'),
              );
            },
          ),
        )
      ],
    );
  }
}
