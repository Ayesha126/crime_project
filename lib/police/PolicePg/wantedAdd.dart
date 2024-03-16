import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../widgetsPolice/titlebar.dart';


class WantedInsertPage extends StatefulWidget {
  @override
  _WantedInsertPageState createState() => _WantedInsertPageState();
}

class _WantedInsertPageState extends State<WantedInsertPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController photoUrlController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  String nameErrorText = '';
  String photoUrlErrorText = '';
  String descriptionErrorText = '';
  File? _image; // Add a variable to store the selected image

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: Color(0xFF7B0305), // Change primary color to red
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF7B0305)),
            borderRadius: BorderRadius.circular(10.0),
          ),
          labelStyle: TextStyle(
            color: Colors.black, // Change label color
          ),
        ),
      ),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTitleBar(title: 'Add Wanted'),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      cursorColor: Color(0xFF7B0305),
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        errorText: nameErrorText.isNotEmpty ? nameErrorText : null,
                      ),
                    ),
                    SizedBox(height: 10),
                     // Display selected image if available

                    TextField(
                      cursorColor: Color(0xFF7B0305),
                      controller: descriptionController,
                      decoration: InputDecoration(
                        labelText: 'Description',
                        errorText: descriptionErrorText.isNotEmpty ? descriptionErrorText : null,
                      ),
                      maxLines: 3,
                    ),
                    SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25), // Adjust border radius as needed
                        color: const Color(0xFF7B0305), // Change color here
                      ),
                      child: ElevatedButton(
                        onPressed: () async {
                          final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery); // Open gallery to select image

                          if (pickedFile != null) {
                            setState(() {
                              _image = File(pickedFile.path); // Store the selected image
                            });
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF7B0305)), // Change color here
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.image), // Add icon on the left side
                            SizedBox(width: 8),
                            Text('Select Image'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    _image != null ? Image.file(_image!) : SizedBox(height: 0),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          nameErrorText = nameController.text.isEmpty ? 'Name cannot be empty' : '';
                          photoUrlErrorText = _image == null ? 'Image cannot be empty' : ''; // Check if image is null
                          descriptionErrorText = descriptionController.text.isEmpty ? 'Description cannot be empty' : '';
                          if (_image == null || _image!.path.isEmpty) { // Check if the image is not selected or its path is empty
                            photoUrlErrorText = 'Image cannot be empty';
                          }
                          if (nameErrorText.isEmpty && photoUrlErrorText.isEmpty && descriptionErrorText.isEmpty) {
                            // Send values to display page
                            Navigator.pop(context, {
                              'name': nameController.text,
                              'photoUrl': _image?.path ?? '', // Use the image path if available, otherwise empty string
                              'description': descriptionController.text,
                            });
                          }
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF7B0305)), // Change color here
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.send), // Add icon on the left side
                          SizedBox(width: 8),
                          Text('Submit'),
                        ],
                      ),
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
}
