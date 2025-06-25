import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/constants/sizes.dart';
import 'package:ecomflutter/Features/OnBoardingPage/Widgets/login_material_button.dart';
import 'package:ecomflutter/Features/OnBoardingPage/Widgets/login_text_field.dart';
import 'package:ecomflutter/utils/shared_func.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CreateNewAccountView extends StatefulWidget {
  const CreateNewAccountView({super.key});

  @override
  State<CreateNewAccountView> createState() => _CreateNewAccountViewState();
}

class _CreateNewAccountViewState extends State<CreateNewAccountView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

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
                controller: _firstNameController,
                hintText: "Firstname",
                validatorFunction: normalValidatorFunction,
              ),
              LoginTextField(
                controller: _lastNameController,
                hintText: "Lastname",
                validatorFunction: normalValidatorFunction,
              ),
              LoginTextField(
                controller: _emailController,
                hintText: "Email address",
                validatorFunction: normalValidatorFunction,
              ),
              LoginTextField(
                controller: _passController,
                hintText: "Password",
                validatorFunction: normalValidatorFunction,
              ),
              CustomeElevatedButton(
                buttonColor: appbarSec,
                prefixIcon: null,
                hintText: "Continue",
                textColor: Colors.white,
                callbackFunction: () async {
                  if (_formKeyAccount.currentState!.validate()) {
                    try {
                      final supabase = Supabase.instance.client;
                      debugPrint("FirstName: ${_firstNameController.text}");
                      debugPrint("LastName: ${_lastNameController.text}");
                      debugPrint("Email: ${_emailController.text}");
                      debugPrint("Password: ${_passController.text}");

                      await supabase.from('Users').insert({
                        'name':
                            "${_firstNameController.text} ${_lastNameController.text}",
                        'email': _emailController.text,
                        'password': _passController.text,
                      });
                      (context).go('/home');
                    } on Exception catch (e) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(e.toString())));
                    }
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
