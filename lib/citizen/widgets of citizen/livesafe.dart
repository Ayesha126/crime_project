import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

import 'offencecard.dart';
import 'HospitalCard.dart';
import 'soscard.dart';
import 'PoliceStationCard.dart';
class LiveSafe extends StatelessWidget {
  const LiveSafe({Key? key}) : super(key: key);
  static Future<void> openMap(String location) async{
    String googleUrl='https://www.google.co.in/maps/search/$location';
    final Uri _url=Uri.parse(googleUrl);
    try{
      await launchUrl(_url);
    }catch(e){
      Fluttertoast.showToast(msg: 'Something went wrong! Call emergency number 112');
    }

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,

      color: Color(0xFFE3F2FD),
      child: GridView.count(
        crossAxisCount: 3,
        physics: BouncingScrollPhysics(),
        children: [
          HospitalCard(onMapFunction: openMap),
          PoliceStationCard(onMapFunction: openMap),
          SOSCard(),
          FIRCard(),
        ],
      ),
    );
  }
}