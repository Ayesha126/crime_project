import 'package:flutter/material.dart';
import 'package:crime_track_master/police/widgetsPolice/titlebar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'archvFiles.dart';
import 'addArchv.dart'; // Import AddArchiveFilesPage



class ArchiveFilesPage extends StatefulWidget {
  @override
  _ArchiveFilesPageState createState() => _ArchiveFilesPageState();
}

class _ArchiveFilesPageState extends State<ArchiveFilesPage> {
  List<ArchiveFile> archiveFiles = [];

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
        textTheme: GoogleFonts.merriweatherTextTheme(), // Apply Google Font to the text theme
    ),
    child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTitleBar(title: 'Archive Files'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: archiveFiles.length,
                itemBuilder: (context, index) {
                  return ArchiveFileCard(
                    caseID: archiveFiles[index].caseID,
                    description: archiveFiles[index].description,
                    status: archiveFiles[index].status,
                    dateArchived: archiveFiles[index].dateArchived,
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () async {
                // Navigate to AddArchiveFilesPage and wait for result
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddArchiveFilesPage()),
                );
                // Check if result is not null and add it to archiveFiles list
                if (result != null) {
                  setState(() {
                    archiveFiles.add(
                      ArchiveFile(
                        caseID: result['caseID']!,
                        description: result['description']!,
                        status: result['status']!,
                        dateArchived: '${DateTime.now().day.toString().padLeft(2, '0')}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().year.toString()}',
                      ),
                    );
                  });
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF7B0305)),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: Text(
                'Insert new Archive file',
                style: GoogleFonts.merriweather(
                  textStyle: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

class ArchiveFile {
  final String caseID;
  final String description;
  final String status;
  final String dateArchived;

  ArchiveFile({
    required this.caseID,
    required this.description,
    required this.status,
    required this.dateArchived,
  });
}

class ArchiveFileCard extends StatelessWidget {
  final String caseID;
  final String description;
  final String status;
  final String dateArchived;

  ArchiveFileCard({
    required this.caseID,
    required this.description,
    required this.status,
    required this.dateArchived,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text('Case ID: $caseID'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Description: $description'),
            Text('Status: $status'),
            Text('Date Archived: $dateArchived'),
          ],
        ),
        onTap: () {
          // Handle tapping on the archive file card
        },
      ),
    );
  }
}
