import 'package:ecomflutter/pages/Records/Widgets/call_api.dart';
import 'package:flutter/material.dart';

class RecordViewBody extends StatelessWidget {
  const RecordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [SizedBox(height: 10), CallApi()]);
  }
}
