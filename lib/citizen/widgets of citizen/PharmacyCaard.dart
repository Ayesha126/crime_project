import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services pages/sos.dart';

class SOSCard extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              sendDistressMessage(['+918000058387', '+917405290860', '+919104109252']);
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
                  child: Image.asset('images/sos.png',
                    height: 32,
                  ),
                ),
              ),
            ),
          ),
          Center(child: Text("SOS") ,)
        ],
      ),
    );
  }
}