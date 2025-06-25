import 'package:ecomflutter/Features/PreferencesPage/AddPages/add_card_view.dart';
import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/constants/sizes.dart';
import 'package:ecomflutter/shared/utils/option_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PaymentSettingsView extends StatelessWidget {
  const PaymentSettingsView({super.key, required this.pageName});
  final String pageName;
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
                      pageName,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 40,
                  height: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(kExtremeRaduis),
                    child: Container(
                      color: kTextForm,
                      child: IconButton(
                        icon: Icon(Icons.add),
                        onPressed:
                            () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => AddCardView(),
                              ),
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Cards",

                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: 72,
                  width: double.infinity,
                  child: OptionListTile(
                    title: "****4187",

                    trailing: IconButton(
                      icon: Image.asset("assets/arrowright2.png"),
                      onPressed: () => {},
                    ),
                  ),
                ),
                SizedBox(
                  height: 72,
                  width: double.infinity,
                  child: OptionListTile(
                    title: "****4187",

                    trailing: IconButton(
                      icon: Image.asset("assets/arrowright2.png"),
                      onPressed: () => {},
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Paypal",

                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: 72,
                  width: double.infinity,
                  child: OptionListTile(
                    title: "abdulluh@gmail.com",

                    trailing: IconButton(
                      icon: Image.asset("assets/arrowright2.png"),
                      onPressed: () => {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
