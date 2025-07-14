import 'dart:async';
import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/utils/helpers/token_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  double _opacity = 1;
  Timer? _timer;
  bool _navigated = false;

  @override
  void initState() {
    super.initState();
    _startLoopAnimation();
    _checkOnBoarding();
  }

  void _startLoopAnimation() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _opacity = _opacity == 1 ? 0.0 : 1.0;
        });
      }
    });
  }

  Future<void> _checkOnBoarding() async {
    try {
      await Future.delayed(
        const Duration(seconds: 3),
      ); // Let animation play at least once

      bool valid = await ensureValidSession();
      _navigate(valid);
    } catch (e) {
      _navigate(false);
    }
  }

  void _navigate(bool valid) {
    if (_navigated) return; // Prevent multiple navigations
    _navigated = true;

    _timer?.cancel();

    if (valid) {
      context.pushReplacement('/home');
    } else {
      context.pushReplacement('/initial');
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appbarSec,
      body: AnimatedOpacity(
        duration: const Duration(seconds: 1),
        opacity: _opacity,
        curve: Curves.easeInOut,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/noCart.png"),
            const SizedBox(height: 5),
            Center(
              child: Text(
                "JimTan",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
