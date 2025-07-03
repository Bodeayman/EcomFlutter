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

  @override
  void initState() {
    super.initState();
    _animate();
    _checkOnBoarding();
  }

  void _animate() async {
    if (mounted) {
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        _opacity = _opacity == 1 ? 0.5 : 1;
      });
    }
  }

  Future<void> _checkOnBoarding() async {
    bool valid = await ensureValidSession();
    if (valid) {
      if (mounted) {
        context.pushReplacement('/home');
      }
    } else {
      if (mounted) {
        context.pushReplacement('/initial');
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appbarSec,
      body: AnimatedOpacity(
        duration: Duration(seconds: 1),
        opacity: _opacity,
        curve: Curves.easeIn,

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
