import 'package:ecomflutter/pages/Records/Widgets/record_view_body.dart';
import 'package:ecomflutter/pages/Home/home_view.dart';
import 'package:flutter/material.dart';

class RecordView extends StatelessWidget {
  const RecordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Records"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed:
              () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Home()),
              ),
        ),
      ),
      body: RecordViewBody(),
    );
  }
}
