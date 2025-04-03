import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/constants/sizes.dart';
import 'package:ecomflutter/pages/Home/home_view.dart';
import 'package:ecomflutter/pages/OnBoarding/Widgets/login_material_button.dart';
import 'package:ecomflutter/pages/OnBoarding/Widgets/login_text_field.dart';
import 'package:ecomflutter/pages/OnBoarding/Widgets/sign_in_group_buttons.dart';
import 'package:ecomflutter/pages/OnBoarding/Widgets/sign_in_text.dart';
import 'package:ecomflutter/pages/OnBoarding/create_new_account_view.dart';
import 'package:ecomflutter/utils/shared_pref_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InitialSignView extends StatefulWidget {
  const InitialSignView({super.key});

  @override
  State<InitialSignView> createState() => _InitialSignViewState();
}

class _InitialSignViewState extends State<InitialSignView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _checkOnBoarding();
  }

  Future<void> _checkOnBoarding() async {
    bool onBoard = await onBoarding();
    if (onBoard) {
      if (mounted) {
        context.pushReplacement('/');
      }
    } else {
      setOnBoarding(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 110),
            Align(alignment: Alignment.centerLeft, child: SignInText()),
            const SizedBox(height: 30),
            Form(
              key: _formKey,
              child: SizedBox(
                height: 56,
                child: LoginTextField(
                  controller: _emailEditingController,
                  hintText: "Email Address",
                  validatorFunction: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter your email";
                    }
                    return null;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: SizedBox(
                height: kLoginScreenButtonHeight,

                child: CustomeElevatedButton(
                  buttonColor: appbarSec,
                  prefixIcon: null,
                  hintText: "Continue",
                  textColor: Colors.white,
                  callbackFunction: () {
                    if (_formKey.currentState!.validate()) {
                      context.go("/");
                    }
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Text(
                    "Don't have an account,",
                    style: TextStyle(fontSize: 12),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      splashFactory: NoSplash.splashFactory,
                    ),
                    child: Text(
                      "Create one",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,

                        fontSize: 12,
                      ),
                    ),
                    onPressed:
                        () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => CreateNewAccountView(),
                          ),
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            SignInGroupButtons(),
          ],
        ),
      ),
    );
  }
}
