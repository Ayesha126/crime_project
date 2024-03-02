import 'package:flutter/material.dart';

class PoliceStationCard extends StatelessWidget {
  final Function? onMapFunction;
  const PoliceStationCard({Key? key,this.onMapFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          Center(
            child: InkWell(
              onTap: () {
                onMapFunction!('police stations near me');
              },
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Image.asset('images/police station.png',
                      height: 32,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Text("Police Stations"),
          ),
        ],
      ),
    );
  }
}