import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crime_track_master/police/widgetsPolice/titlebar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ComplaintPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomTitleBar(title: 'Complaint Page'), // Custom title bar
            SizedBox(height: 10),
            Expanded(
              child: ListView( // Wrap with ListView
                children: [
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection('offence').snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final offences = snapshot.data?.docs.reversed.toList();
                        List<Widget> offenceWidgets = [];
                        for (var offence in offences!) {
                          offenceWidgets.add(
                            Card(
                              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Complainant Contact:  ${offence['Complainant Contact']}'),
                                    Text('Complainant Name:  ${offence['Complainant Name']}'),
                                    Text('Incident Date:  ${offence['Incident Date']}'),
                                    Text('Incident Details:  ${offence['Incident Details']}'),
                                    Text('Incident Type:  ${offence['Incident Type']}'),
                                    Text('Relationship to Victim:  ${offence['Relationship to Victim']}'),
                                    Text('Victim Address:  ${offence['Victim Address']}'),
                                    Text('Victim Name:  ${offence['Victim Name']}'),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                        return Column(
                          children: offenceWidgets,
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(), // Show a loading indicator if data is not yet available
                        );
                      }
                    },
                  ),
                  MiddleTitleBar(title: 'Anonymously Filed Complaints', height: 50),
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection('anonymouslyfir').snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final anonymouslyfirs = snapshot.data?.docs.reversed.toList();
                        List<Widget> anonymouslyfirWidgets = [];
                        for (var anonymouslyfir in anonymouslyfirs!) {
                          anonymouslyfirWidgets.add(
                            Card(
                              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Offence Category:  ${anonymouslyfir['Offence category']}'),
                                    Text('Police District:  ${anonymouslyfir['Police District']}'),
                                    Text('Police Station:  ${anonymouslyfir['Police Station']}'),
                                    Text('Place Of Occurence:  ${anonymouslyfir['Place of Occurence']}'),
                                    Text('Offence Description:  ${anonymouslyfir['Offence description']}'),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                        return Column(
                          children: anonymouslyfirWidgets,
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(), // Show a loading indicator if data is not yet available
                        );
                      }
                    },
                  ),
                  MiddleTitleBar(title: 'Cyber Crime Complaints', height: 50),
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection('cyberfir').snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final anonymouslyfirs = snapshot.data?.docs.reversed.toList();
                        List<Widget> anonymouslyfirWidgets = [];
                        for (var cyberfir in anonymouslyfirs!) {
                          anonymouslyfirWidgets.add(
                            Card(
                              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Fraud Number:  ${cyberfir['Fraud Number']}'),
                                    Text('Remark:  ${cyberfir['Remark']}'),
                                    Text('Type of Fraud:  ${cyberfir['Type of Fraud']}'),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                        return Column(
                          children: anonymouslyfirWidgets,
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(), // Show a loading indicator if data is not yet available
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
