import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nst_app/bloc/user_auth_bloc/user_auth_bloc.dart';
import 'package:nst_app/constants/route_constants.dart';
import 'package:nst_app/presentation/new%20user%20screens/widgets/button1.dart';
import 'package:nst_app/presentation/new%20user%20screens/widgets/emailtextformfield.dart';
import 'package:nst_app/presentation/new%20user%20screens/widgets/passwordtextformfield.dart';
import 'package:nst_app/presentation/new%20user%20screens/widgets/text_divider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleForgotPasswordTap() {
    debugPrint("Forgot password?");
  }

  void _handleSignInTap() {
    context.read<UserAuthBloc>().add(
          UserAuthLoginRequested(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
          ),
        );
  }

  void _handleCreateAccountTap() {
    context.pushReplacementNamed(RouteConstants.signUp);
  }

  void _handleGoogleLoginTap() {}

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserAuthBloc, UserAuthState>(
      listener: (context, state) {
        // shows error in SnackBar
        if (state is UserAuthFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        }
        // goes to capture page if successfull
        if (state is UserAuthSuccess) {
          context.pushReplacementNamed(RouteConstants.capture);
        }
      },
      builder: (context, state) {
        // shows loading screen while the authetication
        if (state is UserAuthLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text('Login with your Account'),
          ),
          body: Form(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Spacer(),
                    EmailTextFormField(controller: _emailController),
                    const Spacer(),
                    PasswordTextFormField(
                      controller: _passwordController,
                      labelText: "Password*",
                    ),
                    const Spacer(),
                    RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        text: 'Forgot Password?',
                        style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.none,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = _handleForgotPasswordTap,
                      ),
                    ),
                    const Spacer(),
                    Button1(label: "Login", onPressed: _handleSignInTap),
                    const Spacer(),
                    const TextDivider(label: 'or continue with'),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: _handleGoogleLoginTap,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.transparent,
                            child: ClipOval(
                              child: SvgPicture.asset("assets/google_icon.svg"),
                            ),
                          ),
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.transparent,
                          child: ClipOval(
                            child: SvgPicture.asset("assets/facebook_icon.svg"),
                          ),
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.transparent,
                          child: ClipOval(
                            child: SvgPicture.asset("assets/twitter_icon.svg"),
                          ),
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.transparent,
                          child: ClipOval(
                            child: SvgPicture.asset("assets/apple_icon.svg"),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(flex: 14),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: "Don't have an account? ",
                          style: const TextStyle(color: Colors.white30),
                          children: [
                            TextSpan(
                              text: 'Create an account',
                              style: const TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.none,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = _handleCreateAccountTap,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
