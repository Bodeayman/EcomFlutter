import 'package:ecomflutter/Features/OnBoardingPage/Widgets/login_material_button.dart';
import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddAddressView extends StatelessWidget {
  const AddAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RawMaterialButton(
                  onPressed: () => context.pop(),
                  constraints: BoxConstraints.tightFor(width: 50, height: 50),
                  shape: const CircleBorder(),
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
                Expanded(
                  child: Center(
                    child: Text(
                      "Add Address",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 40, height: 40),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(kSettingsTile),
                          child: Container(
                            height: 54,
                            width: double.infinity,
                            color: kTextForm,

                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Street Address",
                                hintStyle: TextStyle(color: kTextInsideForm),

                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(kSettingsTile),
                          child: Container(
                            height: 54,
                            color: kTextForm,

                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "City",
                                hintStyle: TextStyle(color: kTextInsideForm),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  kSettingsTile,
                                ),
                                child: Container(
                                  height: 54,
                                  color: kTextForm,

                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "State",
                                      hintStyle: TextStyle(
                                        color: kTextInsideForm,
                                      ),

                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  kSettingsTile,
                                ),
                                child: Container(
                                  height: 54,
                                  color: kTextForm,

                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                        color: kTextInsideForm,
                                      ),

                                      hintText: "Zip Code",
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),

                  CustomeElevatedButton(
                    callbackFunction: () => context.pop(),
                    buttonColor: appbarSec,
                    hintText: "Save",
                    textColor: Colors.white,
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
