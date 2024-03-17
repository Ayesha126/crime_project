import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgetsPolice/titlebar.dart';

class CrimeSceneChecklistPage extends StatefulWidget {
  @override
  _CrimeSceneChecklistPageState createState() => _CrimeSceneChecklistPageState();
}

class _CrimeSceneChecklistPageState extends State<CrimeSceneChecklistPage> {
  List<ChecklistItem> checklistItems = [
    ChecklistItem(title: 'Secure the perimeter'),
    ChecklistItem(title: 'Obtain necessary warrants'),
    ChecklistItem(title: 'Document entry and exit points'),
    ChecklistItem(title: 'Assess the scene safety'),
    ChecklistItem(title: 'Identify and separate witnesses'),
    ChecklistItem(title: 'Interview witnesses and record statements'),
    ChecklistItem(title: 'Observe and document initial observations'),
    ChecklistItem(title: 'Take overall photographs of the scene'),
    ChecklistItem(title: 'Establish initial boundary for processing'),
    ChecklistItem(title: 'Take detailed photographs of evidence'),
    ChecklistItem(title: 'Sketch the scene layout'),
    ChecklistItem(title: 'Collect and preserve physical evidence'),
    ChecklistItem(title: 'Package and label collected evidence'),
    ChecklistItem(title: 'Document the chain of custody'),
    ChecklistItem(title: 'Search for additional evidence'),
    ChecklistItem(title: 'Collect trace evidence (e.g., fibers, hairs)'),
    ChecklistItem(title: 'Collect biological evidence (e.g., blood, saliva)'),
    ChecklistItem(title: 'Collect firearms or weapons if present'),
    ChecklistItem(title: 'Process digital evidence (e.g., computers, phones)'),
    ChecklistItem(title: 'Collect fingerprints from relevant surfaces'),
    ChecklistItem(title: 'Document bloodstain patterns if applicable'),
    ChecklistItem(title: 'Collect DNA samples if applicable'),
    ChecklistItem(title: 'Document and collect footwear impressions if present'),
    ChecklistItem(title: 'Document and collect tire impressions if present'),
    ChecklistItem(title: 'Document and collect tool marks if present'),
    ChecklistItem(title: 'Document and collect tool mark impressions if present'),
    ChecklistItem(title: 'Collect other impression evidence (e.g., bite marks)'),
    ChecklistItem(title: 'Conduct latent print processing'),
    ChecklistItem(title: 'Conduct alternative light source examination'),
    ChecklistItem(title: 'Collect hair and fiber samples'),
    ChecklistItem(title: 'Collect soil and vegetation samples'),
    ChecklistItem(title: 'Document and collect arson evidence if applicable'),
    ChecklistItem(title: 'Document and collect explosive residue if applicable'),
    ChecklistItem(title: 'Document and collect chemical evidence if applicable'),
    ChecklistItem(title: 'Conduct blood spatter analysis if applicable'),
    ChecklistItem(title: 'Conduct gunshot residue analysis if applicable'),
    ChecklistItem(title: 'Conduct forensic examination if applicable'),
    ChecklistItem(title: 'Document and collect electronic evidence if applicable'),
    ChecklistItem(title: 'Document and collect chemical trace evidence if applicable'),
    ChecklistItem(title: 'Document and collect digital image evidence if applicable'),
    ChecklistItem(title: 'Document and collect video evidence if applicable'),
    ChecklistItem(title: 'Document and collect audio evidence if applicable'),
    ChecklistItem(title: 'Conduct digital forensics examination if applicable'),
    ChecklistItem(title: 'Document the condition of the scene before leaving'),
    ChecklistItem(title: 'Secure the scene before leaving'),
    ChecklistItem(title: 'Complete required documentation and reports'),
    ChecklistItem(title: 'Coordinate with other investigators and agencies'),
    ChecklistItem(title: 'Hand over evidence to the evidence custodian'),
    ChecklistItem(title: 'Submit evidence for forensic analysis'),
    ChecklistItem(title: 'Follow up on any leads or additional evidence'),
    ChecklistItem(title: 'Review and analyze collected evidence'),
    ChecklistItem(title: 'Assist with any further investigation or prosecution'),
    // Add more checklist items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        textTheme: GoogleFonts.merriweatherTextTheme(), // Apply Google Font to the text theme
      ),
      child: Scaffold(
        body: Column(
            children: [
            CustomTitleBar(title: 'Crime Scene Checklist'),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left:16.0,right:16.0,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics() ,
                    itemCount: checklistItems.length,
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                        title: Text(checklistItems[index].title),
                        value: checklistItems[index].isChecked,
                        activeColor: const Color(0xFF7B0305), // Set the active color to red
                        onChanged: (value) {
                          setState(() {
                            checklistItems[index].isChecked = value!;
                          });
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Completion Progress: ${calculateCompletion().toStringAsFixed(2)}%', // Format completion progress to two decimal points
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    LinearProgressIndicator(
                      value: calculateCompletion() / 100,
                      valueColor: AlwaysStoppedAnimation<Color>(calculateCompletion() == 100 ?  Colors.green : Colors.red), // Change color to red when completion is 100%
                    ),
                  ],
                ),
              ),
            ],
        ),
      ),
    );
  }


  double calculateCompletion() {
    int totalItems = checklistItems.length;
    int completedItems = checklistItems.where((item) => item.isChecked).length;
    return totalItems == 0 ? 0 : (completedItems / totalItems) * 100;
  }
}

class ChecklistItem {
  final String title;
  bool isChecked;

  ChecklistItem({required this.title, this.isChecked = false});
}
