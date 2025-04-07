import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/constants/sizes.dart';
import 'package:flutter/material.dart';

class AllTabsWidget extends StatefulWidget {
  const AllTabsWidget({super.key});

  @override
  State<AllTabsWidget> createState() => _AllTabsWidgetState();
}

class _AllTabsWidgetState extends State<AllTabsWidget> {
  final List<String> tabs = const [
    "Processing",
    "Shipped",
    "Delivered",
    "Return",
    "Canceled",
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: tabs.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 6.5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(kExtremeRaduis),
            child: MaterialButton(
              elevation: 0,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              onPressed: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              color: selectedIndex == index ? appbarSec : kTextForm,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 4.0,
                ),
                child: Text(
                  tabs[index],
                  style: TextStyle(
                    color: selectedIndex == index ? Colors.white : Colors.black,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
