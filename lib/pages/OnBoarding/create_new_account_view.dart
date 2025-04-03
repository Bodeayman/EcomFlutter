import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/constants/sizes.dart';
import 'package:ecomflutter/pages/OnBoarding/Widgets/login_material_button.dart';
import 'package:ecomflutter/pages/OnBoarding/Widgets/login_text_field.dart';
import 'package:ecomflutter/utils/shared_func.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreateNewAccountView extends StatefulWidget {
  const CreateNewAccountView({super.key});

  @override
  State<CreateNewAccountView> createState() => _CreateNewAccountViewState();
}

class _CreateNewAccountViewState extends State<CreateNewAccountView> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKeyAccount = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKeyAccount,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => context.pushReplacement("/initial"),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: kTextForm,
                          borderRadius: BorderRadius.circular(100),
                        ),

                        child: Image.asset("assets/arrowleft2.png"),
                      ),
                    ),
                    Text(
                      "Create Account",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: kTitleHeight,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 35),
              LoginTextField(
                controller: _emailController,
                hintText: "Firstname",
                validatorFunction: normalValidatorFunction,
              ),
              LoginTextField(
                controller: _emailController,
                hintText: "Lastname",
                validatorFunction: normalValidatorFunction,
              ),
              LoginTextField(
                controller: _emailController,
                hintText: "Email address",
                validatorFunction: normalValidatorFunction,
              ),
              LoginTextField(
                controller: _emailController,
                hintText: "Password",
                validatorFunction: normalValidatorFunction,
              ),
              CustomeElevatedButton(
                buttonColor: appbarSec,
                prefixIcon: null,
                hintText: "Continue",
                textColor: Colors.white,
                callbackFunction: () {
                  if (_formKeyAccount.currentState!.validate()) {
                    (context).go('/');
                  }
                },
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text("Forgot password?", style: TextStyle(fontSize: 12)),
                    TextButton(
                      style: TextButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                      ),
                      child: Text(
                        "Reset",
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
            ],
          ),
        ),
      ),
    );
  }
}
