import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:crime_track_master/police/PolicePg/staffDetails.dart';
import 'package:crime_track_master/police/widgetsPolice/titlebar.dart';
import 'package:google_fonts/google_fonts.dart';

class StaffDisplayPage extends StatefulWidget {
  final List<String> staffDetails;

  StaffDisplayPage({required this.staffDetails});

  @override
  _StaffDisplayPageState createState() => _StaffDisplayPageState();
}

class _StaffDisplayPageState extends State<StaffDisplayPage> {
  @override
  Widget build(BuildContext context) {
    // Transparent color

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomTitleBar(title: 'Staff Details'), // Custom title bar
            SizedBox(height: 10),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('staffdetails').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final staffsdetail = snapshot.data?.docs.reversed.toList();
                    List<Widget> staffwidgets = [];
                    for (var staffdetails in staffsdetail!) {
                      staffwidgets.add(
                        Card(
                          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Staff Department:  ${staffdetails['Staff Department']}'),
                                Text('Staff Email:  ${staffdetails['Staff Email']}'),
                                Text('Staff Name:  ${staffdetails['Staff Name']}'),
                                Text('Staff Phone Number:  ${staffdetails['Staff Phone Number']}'),
                                Text('Staff Position:  ${staffdetails['Staff Position']}'),
                                Text('Staff ID:  ${staffdetails['Staff ID']}'),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                    return ListView(
                      shrinkWrap: true,
                      children: staffwidgets,
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StaffDetailsPage(
                        onSubmit: (details) {
                          setState(() {
                            // Update the parent's state with the new details
                            widget.staffDetails.add(details);
                          });
                        },
                      ),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0xFF7B0305)), // Change color here
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: Text(
                  'Add new Staff ',
                  style: GoogleFonts.merriweather( // Example of changing font to Open Sans
                    textStyle: const TextStyle(
                      fontSize: 18,
                      color: Colors.white, // Background color of the title bar
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
