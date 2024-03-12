import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets of citizen/PoliceStationCard.dart';
class HospitalStation extends StatelessWidget {
  final Function onMapFunction;

  const HospitalStation({Key? key, required this.onMapFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          onMapFunction('hospitals near me');
        },
      ),
    );
  }
}