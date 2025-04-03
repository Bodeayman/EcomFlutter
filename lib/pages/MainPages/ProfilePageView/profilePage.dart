import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/constants/sizes.dart';
import 'package:ecomflutter/pages/MainPages/ProfilePageView/Widgets/profile_details_tile.dart';
import 'package:ecomflutter/shared/utils/option_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<String> settingsOptions = [
    "Address",
    "Wishlist",
    "Payment",
    "Help",
    "Support",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 89),
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: SizedBox(
                height: 80,
                width: 80,
                child: Image.asset("assets/img/stripe.png"),
              ),
            ),
            const SizedBox(height: 20),
            ProfileDetailsTile(),
            SizedBox(
              height: 400,
              width: 342,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: settingsOptions.length,
                itemBuilder: (context, index) {
                  return OptionListTile(
                    title: settingsOptions[index],
                    trailing: IconButton(
                      icon: Image.asset("assets/arrowright2.png"),
                      onPressed: () {},
                    ),
                  );
                },
              ),
            ),
            TextButton(
              child: Text(
                "Sign Out",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                (context).pushReplacement('/initial');
              },
            ),
          ],
        ),
      ),
    );
  }
}
