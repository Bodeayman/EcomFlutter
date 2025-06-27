import 'package:ecomflutter/Features/OnBoardingPage/Widgets/login_material_button.dart';
import 'package:ecomflutter/Features/OnBoardingPage/Widgets/sign_in_text.dart';
import 'package:ecomflutter/Features/OnBoardingPage/create_new_account_view.dart';
import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/constants/sizes.dart';
import 'package:ecomflutter/utils/helpers/token_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class PasswordCheckView extends StatefulWidget {
  const PasswordCheckView({super.key, required this.emailText});
  final String emailText;
  @override
  State<PasswordCheckView> createState() => _PasswordCheckViewState();
}

class _PasswordCheckViewState extends State<PasswordCheckView> {
  final GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 110),
              Align(alignment: Alignment.centerLeft, child: SignInText()),
              const SizedBox(height: 30),
              Form(
                key: formKey,
                child: SizedBox(
                  height: 70,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(kBorderSize),
                      child: Container(
                        height: 70,
                        width: double.infinity,
                        decoration: BoxDecoration(color: Color(0xffF4F4F4)),
                        child: TextFormField(
                          controller: _passwordController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Please enter your password";
                            }
                            return null;
                          },

                          decoration: InputDecoration(
                            focusedErrorBorder: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 0,
                            ),

                            hintStyle: TextStyle(color: kTextFieldHint),
                            errorBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            fillColor: Color(0xffF4F4F4),
                            hintText: "Password",
                          ),
                        ),
                      ),
                    ),
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
                    callbackFunction: () async {
                      try {
                        if (formKey.currentState!.validate()) {
                          debugPrint(_passwordController.text);
                          showTopSnackBar(
                            Overlay.of(context),
                            CustomSnackBar.info(message: "Wait...."),
                            displayDuration: Duration(seconds: 1),
                          );
                          final response = await Supabase.instance.client.auth
                              .signInWithPassword(
                                email: widget.emailText,
                                password: _passwordController.text,
                              );

                          final session = response.session;
                          if (session != null) {
                            await saveSession(session);
                            context.go("/home");
                          }
                        }
                      } catch (e) {
                        debugPrint(e.toString());
                        showTopSnackBar(
                          Overlay.of(context),
                          CustomSnackBar.error(message: e.toString()),
                          displayDuration: Duration(seconds: 1),
                        );
                      }
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text("Forgot password", style: TextStyle(fontSize: 12)),
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
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
