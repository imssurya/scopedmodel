import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:scopedmodel/donationmodelscreen.dart';
import 'package:scopedmodel/model/donationmodel.dart';

void main() {
  runApp(MyApp());
}

DonationModel donationModel = DonationModel();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<DonationModel>(
      model: donationModel,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter scoped modal demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: DonationModelScreen(),
      ),
    );
  }
}
