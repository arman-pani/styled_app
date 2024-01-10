import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nst_app/presentation/new%20user%20screens/widgets/button1.dart';
import 'package:pinput/pinput.dart';

class VerifyEmailPage extends StatefulWidget {
  final String userEmailID;
  const VerifyEmailPage({
    super.key,
    required this.userEmailID,
  });

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  void _handleVerifyOTPTap() {}
  void _handleResendOTPTap() {}
  void _handleChangeEmailTap() {}
  int minutes = 2;
  int seconds = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        if (minutes == 0 && seconds == 0) {
          timer.cancel();
        } else if (seconds == 0) {
          seconds = 59;
          minutes--;
        } else {
          seconds--;
        }
      });
    });
  }

  String getTimerText() {
    String minuteStr = (minutes < 10) ? '0$minutes' : '$minutes';
    String secondStr = (seconds < 10) ? '0$seconds' : '$seconds';
    return '$minuteStr:$secondStr';
  }

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.white30),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Verify your Email"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "We have sent a 4-digit verification code to ",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.start,
            ),
            Text(
              widget.userEmailID,
              textAlign: TextAlign.start,
              style: const TextStyle(fontSize: 20),
            ),
            const Spacer(),
            Center(
              child: Pinput(
                  defaultPinTheme: defaultPinTheme,
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  validator: (pin) {
                    if (pin == '2224') return null;

                    return 'Incorrect code';
                  }),
            ),
            const Spacer(),
            Center(
                child: Button1(
                    label: "Verify OTP", onPressed: _handleVerifyOTPTap)),
            const Spacer(),
            Text("The OTP will be expired in ${getTimerText()}"),
            const Spacer(),
            RichText(
              text: TextSpan(
                text: "Didn't receive the code? ",
                style: const TextStyle(color: Colors.white30),
                children: [
                  TextSpan(
                    text: 'Resend OTP',
                    style: const TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.none,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = _handleResendOTPTap,
                  ),
                  const TextSpan(text: " or "),
                  TextSpan(
                    text: 'Change Email',
                    style: const TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.none,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = _handleChangeEmailTap,
                  ),
                ],
              ),
            ),
            const Spacer(flex: 14),
          ],
        ),
      ),
    );
  }
}
