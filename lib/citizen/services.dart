import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServicePage extends StatefulWidget {
  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Services'),
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 16.0, right: 16.0, bottom: 8.0, top: 16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Search for services...',
                prefixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.only(
                    left: 16.0, top: 8.0, bottom: 8.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(32.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10), // add padding to the left side
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                    color: Color(0xFF90CAF9),
                    borderRadius: BorderRadius.circular(10), // make the border circular
                  ),
                  child: Text(
                    "Emergency Contacts",
                    style: GoogleFonts.laila(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1565C0),
                    ),
                  ),
                ),

              ),
            ],
          ),
           // 10 logical pixels of space
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width - 20,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset('images/sos.png', scale: 3.7),
                    ),
                    SizedBox(height: 10), // add some space between the image and the text
                    Center(
                      child: Text('SOS'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset('images/phone.png', scale: 3.7),
                    ),
                    SizedBox(height: 10), // add some space between the image and the text
                    Center(
                      child: Text('All India Emergency'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}