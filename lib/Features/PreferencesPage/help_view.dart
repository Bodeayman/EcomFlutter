import 'package:ecomflutter/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HelpView extends StatelessWidget {
  const HelpView({super.key, required this.pageName});
  final String pageName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                      pageName,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 40, height: 40),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello there, Welcome to my store Jimtan",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 5),
                Text(
                  "Q: If you have some questions related to the app development ? ",
                ),
                const SizedBox(height: 5),

                Text(
                  "A: The app is under development, but can be used by both the shopkeepers, and the buyers",
                ),
                const SizedBox(height: 5),
                Text("Q: Do we buy any products other than Clothes?"),
                const SizedBox(height: 5),

                Text(
                  "A: Unfortunately this app is related only to Clothes, so any other business will need new app",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
