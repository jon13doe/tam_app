import 'package:flutter/gestures.dart';
import 'package:tam_app/features/widgets/login_button.dart';
import 'package:tam_app/global_imports.dart';

class SignIn extends StatefulWidget {
  final Function(bool) onPush;

  const SignIn({super.key, required this.onPush});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText = true;
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 0.8 * MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sign in',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              RichText(
                text: TextSpan(
                  text: "or ",
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                      text: "create an account",
                      style: const TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          widget.onPush(false);
                        },
                    ),
                  ],
                ),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                  ),
                ),
                obscureText: obscureText,
              ),
              Row(
                children: [
                  Checkbox(
                    value: rememberMe,
                    onChanged: (value) {
                      setState(() {
                        rememberMe = value ?? false;
                      });
                    },
                  ),
                  const Text('Remember me'),
                ],
              ),
            ],
          ),
        ),
        const LoginButton(
          text: 'Sign in',
        ),
        const SizedBox(
          height: 16,
        ),
        const LoginButton(
          text: 'Sign in with Google',
          loginIco: FontAwesomeIcons.google,
        ),
        const SizedBox(
          height: 16,
        ),
        RichText(
          text: TextSpan(
            text: "Don't have an account? ",
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: "Sign Up",
                style: const TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    widget.onPush(false);
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
