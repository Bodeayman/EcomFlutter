import 'dart:ui';

import 'package:ecomflutter/constants/sizes.dart';
import 'package:ecomflutter/model/data/color.dart';
import 'package:ecomflutter/model/data/size.dart';
import 'package:ecomflutter/Features/DetailsPage/Widgets/color_list_tile.dart';
import 'package:ecomflutter/Features/DetailsPage/Widgets/size_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void showColors(BuildContext context, List<CustomerColor> itemColors) {
  print(itemColors);
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return (itemColors.isNotEmpty)
          ? Container(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Stack(
                  children: [
                    Center(
                      child: Text(
                        "Colors",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 50,
                      child: SizedBox(
                        height: kIconSize,
                        width: kIconSize,
                        child: IconButton(
                          onPressed: context.pop,
                          icon: Icon(Icons.close),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ColorListTile(
                        colorName: itemColors[index].colorName,
                        colorAddress: itemColors[index].color,
                      );
                    },
                    itemCount: itemColors.length,
                  ),
                ),
              ],
            ),
          )
          : Center(child: Text("Unfortunately, No Colors Found"));
    },
  );
}

void showSizes(BuildContext context, List<CustomerSize> itemSizes) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return (itemSizes.isNotEmpty)
          ? Container(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Stack(
                  children: [
                    Center(
                      child: Text(
                        "Sizes",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 50,
                      child: SizedBox(
                        height: kIconSize,
                        width: kIconSize,
                        child: IconButton(
                          onPressed: context.pop,
                          icon: Icon(Icons.close),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return SizeListTile(itemSize: itemSizes[index].size);
                    },
                    itemCount: itemSizes.length,
                  ),
                ),
              ],
            ),
          )
          : Center(child: Text("Unfortunately, No Sizes Found"));
    },
  );
}
