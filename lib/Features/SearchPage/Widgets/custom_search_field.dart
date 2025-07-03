import 'package:ecomflutter/Features/SearchPage/Widgets/search_found_results.dart';
import 'package:ecomflutter/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
    required this.parentContext,
    required this.controller,
  });
  final TextEditingController controller;
  final BuildContext parentContext;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),

        child: Container(
          decoration: BoxDecoration(color: kTextForm),
          child: TextField(
            onSubmitted: (value) {
              Navigator.of(parentContext).push(
                MaterialPageRoute(
                  builder:
                      (parentContext) =>
                          SearchFoundResultsView(searchController: controller),
                ),
              );
            },
            controller: controller,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 10),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: "Search",
              fillColor: Colors.grey,
              prefixIcon: Image.asset("assets/searchnormal1.png"),
            ),
          ),
        ),
      ),
    );
  }
}

void SearchforItems(String query, BuildContext context) {}
