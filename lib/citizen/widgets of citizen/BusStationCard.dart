import 'package:crime_track_master/citizen/services%20pages/report%20to%20us/fir.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FIRCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FIRPage()),
              );
            },
            child: InkWell(
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Image.asset('images/report.png',
                      height: 32,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(child: Text("FIR") ,),
        ],
      ),
    );
  }
}