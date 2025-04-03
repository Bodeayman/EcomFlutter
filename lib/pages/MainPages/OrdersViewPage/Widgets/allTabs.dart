import 'package:ecomflutter/constants/colors.dart';
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
        return Row(
          children: [
            const SizedBox(width: 10),
            InkWell(
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: selectedIndex == index ? appbarSec : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 15,
                  ),
                  child: Text(
                    tabs[index],
                    style: TextStyle(
                      color:
                          selectedIndex == index
                              ? Colors.white
                              : const Color(0xff7C7C80),
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
