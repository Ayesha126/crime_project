import 'package:flutter/material.dart';
class DetailsButton extends StatefulWidget {
  final Function() onPressed;
  DetailsButton({required this.onPressed});

  @override
  _DetailsButtonState createState() => _DetailsButtonState();
}

class _DetailsButtonState extends State<DetailsButton> {
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container( // Container acts as a placeholder for the button's child
      child: TextButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Theme(
                data: Theme.of(context).copyWith(
                  dialogTheme: DialogTheme(
                    backgroundColor: Colors.grey[200], // Background color of the dialog
                    titleTextStyle: TextStyle(
                      color: Color(0xFF7B0305), // Color of the title text
                      fontSize: 20, // Font size of the title text
                    ),
                    contentTextStyle: TextStyle(color: (Color(0xFF7B0305))), // Text style for the content
                  ),
                ),
                child: AlertDialog(
                  title: Text("Enter password"),
                  content: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    cursorColor: (Color(0xFF7B0305)), // Change color of the cursor
                    decoration: InputDecoration(
                      labelText: "Password",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: (Color(0xFF7B0305))), // Change color of the underline when focused
                      ),
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(Color(0xFF7B0305)), // Change color of the text
                      ),
                      child: Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () {
                        if (_passwordController.text == "12345") {
                          Navigator.of(context).pop(); // Close the dialog
                          widget.onPressed(); // Navigate to the DetailsPage
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Row(
                                  children: [
                                    Icon(
                                      Icons.warning,
                                      color: Colors.orange, // Customize the color of the icon as needed
                                    ),
                                     // Add some space between the icon and text
                                    Text('Incorrect Password'),
                                  ],
                                ),
                                content: Text('Please enter the correct password.'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    style: ButtonStyle(
                                      foregroundColor: MaterialStateProperty.all(Color(0xFF7B0305)), // Change color of the text
                                    ),
                                    child: Text("OK"),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(Color(0xFF7B0305)), // Change color of the text
                      ),
                      child: Text("OK"),
                    ),
                  ],
                ),
              );
            },
          );
        },
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Color(0xFF7B0305)), // Change color of the text
        ),
        child: Text("Please Enter Password to open Staff Details: "), // Child widget for the TextButton
      ),
    );
  }
}
