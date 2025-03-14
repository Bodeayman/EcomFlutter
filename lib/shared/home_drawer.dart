import 'package:ecomflutter/shared/listtile.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text(
                  "Abdullah",
                  style: TextStyle(color: Colors.black),
                ),
                accountEmail: Text(
                  "abdullah@gmail.com",
                  style: TextStyle(color: Colors.black),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/img/my_img.jpg"),
                  radius: 55,
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/img/background.jpg"),
                      fit: BoxFit.cover),
                ),
              ),
              Column(
                children: [
                  //They are self defined widgets
                  ListSetting(
                      my_icon: const Icon(Icons.settings),
                      hint_list: "Settings"),
                  ListSetting(
                      my_icon: const Icon(Icons.shopping_cart),
                      hint_list: "My products"),
                  ListSetting(
                      my_icon: const Icon(Icons.help), hint_list: "Help"),
                  ListSetting(
                      my_icon: const Icon(Icons.logout), hint_list: "Logout"),
                  ListSetting(
                      my_icon: const Icon(Icons.receipt), hint_list: "Records"),
                ],
              ),

              //UserAccountsDrawerHeader the most important inside the Drawer
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            child: const Text(
              "Developed by Abdullah",
            ),
          ),
        ],
      ),
    );
  }
}
