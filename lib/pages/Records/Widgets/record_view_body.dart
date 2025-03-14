import 'package:flutter/material.dart';

class RecordViewBody extends StatelessWidget {
  const RecordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Records"),
          ],
        )
      ],
    );
  }
}
