import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/Features/SearchPage/Widgets/search_no_results.dart';
import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  CustomSearchField({super.key, required this.parentContext});
  final TextEditingController _controller = TextEditingController();
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
                  builder: (parentContext) => SearchNoResults(),
                ),
              );
            },
            controller: _controller,
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
