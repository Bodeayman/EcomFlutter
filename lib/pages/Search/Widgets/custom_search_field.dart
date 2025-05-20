import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/pages/Search/Widgets/search_no_results.dart';
import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  CustomSearchField({super.key, required this.bigContext});
  final TextEditingController _controller = TextEditingController();
  final BuildContext bigContext;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),

        child: Container(
          decoration: BoxDecoration(color: kTextForm),
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: "Search",
              fillColor: Colors.grey,
              prefixIcon: InkWell(
                onTap:
                    () => Navigator.of(bigContext).push(
                      MaterialPageRoute(
                        builder: (bigContext) => SearchNoResults(),
                      ),
                    ),
                child: Image.asset("assets/searchnormal1.png"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void SearchforItems(String query, BuildContext context) {}
