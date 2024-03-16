import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgetsPolice/titlebar.dart';

class CrimeSceneChecklistPage extends StatefulWidget {
  @override
  _CrimeSceneChecklistPageState createState() => _CrimeSceneChecklistPageState();
}

class _CrimeSceneChecklistPageState extends State<CrimeSceneChecklistPage> {
  List<ChecklistItem> checklistItems = [
    ChecklistItem(title: 'Collect evidence'),
    ChecklistItem(title: 'Take photographs'),
    ChecklistItem(title: 'Interview witnesses'),
    // Add more checklist items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        textTheme: GoogleFonts.merriweatherTextTheme(), // Apply Google Font to the text theme

      ),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTitleBar(title: 'Crime Scene Checklist'),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
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
                    SizedBox(height: 20),
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
