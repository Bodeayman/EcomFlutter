import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/constants/sizes.dart';
import 'package:ecomflutter/pages/OnBoarding/Widgets/login_material_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchNoResults extends StatelessWidget {
  const SearchNoResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Column(
              children: [
                Image.asset("assets/noSearch.png"),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 24),
                  child: Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      "Sorry, we couldn't find any matching result for your Search.",
                      style: TextStyle(
                        fontSize: kNoTextSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 52,
                  width: 195,
                  child: CustomeElevatedButton(
                    buttonColor: appbarSec,
                    callbackFunction: () {
                      context.pop();
                    },
                    hintText: "Explore Categories",
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
