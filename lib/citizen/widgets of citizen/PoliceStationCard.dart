import 'package:flutter/material.dart';

class PoliceStationCard extends StatelessWidget {
  final Function onMapFunction;

  const PoliceStationCard({Key? key, required this.onMapFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Center( // Wrap with Center widget
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center align content vertically
          children: [
            InkWell(
              onTap: () {
                onMapFunction('police stations near me');
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
                    child: Image.asset(
                      'images/police station.png',
                      height: 35,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8), // Add space between the image and text
            Text(
              "Police Stations",
              textAlign: TextAlign.center, // Center align text horizontally
            ),
          ],
        ),
      ),
    );
  }
}
