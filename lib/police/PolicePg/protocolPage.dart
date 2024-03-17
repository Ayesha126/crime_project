import 'package:crime_track_master/police/widgetsPolice/titlebar.dart';
import 'package:flutter/material.dart';

class ProtocolPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // List of protocols to be followed upon entering a crime scene
    List<String> protocols = [
      'Secure the perimeter of the crime scene.',
      'Identify and interview witnesses.',
      'Document the scene with photographs and sketches.',
      'Collect physical evidence and preserve it properly.',
      'Coordinate with forensic experts for analysis.',
      'Maintain chain of custody for evidence.',
      'Ensure proper documentation of actions taken.',
      'Limit access to authorized personnel only.',
      'Protect the integrity of the crime scene.',
      'Follow proper safety protocols and use protective gear.',
      'Communicate effectively with team members and superiors.',
      'Respect cultural sensitivities and privacy concerns.',
      'Follow established procedures for evidence handling and processing.',
      'Provide support and assistance to victims and bystanders.',
      'Prepare detailed reports and documentation of findings.',
    ];

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTitleBar(title: 'Protocol Page'), // Custom title bar
          Expanded(
            child: ListView.builder(
              itemCount: protocols.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color(0xFF7B0305), // Change circle background color
                    foregroundColor: Colors.white, // Change circle foreground (text) color
                    child: Text('${index + 1}'), // Display protocol number
                  ),
                  title: Text(protocols[index]), // Display protocol description
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
