import 'package:ecomflutter/Features/OnBoardingPage/password_check_view.dart';
import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/constants/sizes.dart';
import 'package:ecomflutter/Features/OnBoardingPage/Widgets/login_material_button.dart';
import 'package:ecomflutter/Features/OnBoardingPage/Widgets/sign_in_group_buttons.dart';
import 'package:ecomflutter/Features/OnBoardingPage/Widgets/sign_in_text.dart';
import 'package:ecomflutter/Features/OnBoardingPage/create_new_account_view.dart';
import 'package:ecomflutter/utils/helpers/token_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

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
  }

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
                key: _formKey,
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
                          controller: _emailEditingController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Please enter your email";
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
                            hintText: "Email Address",
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
                      if (_formKey.currentState!.validate()) {
                        print(
                          "Checking for email: ${_emailEditingController.text}",
                        );

                        showTopSnackBar(
                          Overlay.of(context),
                          CustomSnackBar.info(message: "Wait...."),
                          displayDuration: Duration(seconds: 1),
                        );
                        try {
                          final response =
                              await Supabase.instance.client
                                  .from('Users')
                                  .select('email')
                                  .eq('email', _emailEditingController.text)
                                  .maybeSingle();
                          if (response == null) {
                            showTopSnackBar(
                              Overlay.of(context),
                              CustomSnackBar.error(
                                message: "This email is not found",
                              ),
                            );
                          } else {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder:
                                    (context) => PasswordCheckView(
                                      emailText: _emailEditingController.text,
                                    ),
                              ),
                            );
                          }
                        } catch (e) {
                          showTopSnackBar(
                            Overlay.of(context),
                            CustomSnackBar.error(
                              message: "Connection Failed, Try again",
                            ),
                          );
                        }
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
      ),
    );
  }
}
