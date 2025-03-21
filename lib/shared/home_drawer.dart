import 'package:ecomflutter/shared/listtile.dart';
import 'package:ecomflutter/shared/utils/utils.dart';
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
                  backgroundImage: AssetImage("assets/img/background.jpg"),
                  radius: 55,
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/img/background.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                children: [
                  //They are self defined widgets
                  ListSetting(
                    myIcon: const Icon(Icons.settings),
                    hintList: "Settings",
                    onPressFunc: (context) => GoToSettings(context),
                  ),
                  ListSetting(
                    myIcon: const Icon(Icons.shopping_cart),
                    hintList: "My products",
                    onPressFunc: (context) => GoToProducts(context),
                  ),
                  ListSetting(
                    myIcon: const Icon(Icons.help),
                    hintList: "Help",
                    onPressFunc: (context) => GoToHelp(context),
                  ),
                  ListSetting(
                    myIcon: const Icon(Icons.logout),
                    hintList: "Logout",
                    onPressFunc: (context) => Logout(context),
                  ),
                  ListSetting(
                    myIcon: const Icon(Icons.receipt),
                    hintList: "Records",
                    onPressFunc: (context) => GoToRecords(context),
                  ),
                ],
              ),

              //UserAccountsDrawerHeader the most important inside the Drawer
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            child: const Text("Developed by Abdullah"),
          ),
        ],
      ),
    );
  }
}
