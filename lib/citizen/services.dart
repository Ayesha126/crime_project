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
        title: Text('Services',
        style:TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xFFF8F8F8)
        ),
        ),
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
        body: SingleChildScrollView(
        child: Column(
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
                    color: Color(0xFFFFCC99),
                    borderRadius: BorderRadius.circular(10), // make the border circular
                  ),
                  child: Text(
                    "Emergency Contacts",
                    style: GoogleFonts.laila(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFCC6600),
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
              border: Border.all(
                color: Color(0xFFFFCC99), // Change this to the color you want
                width: 1, // Change this to the width you want
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),

            child: GridView.count(
              crossAxisCount: 2,
              children: [
                Column(
                  children: [
                    SizedBox(height: 40),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset('images/sos.png', scale: 6.0),
                    ),
                    SizedBox(height: 10), // add some space between the image and the text
                    Center(
                      child: Text('SOS'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 40),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset('images/em1.png', scale: 6.0),
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
          SizedBox(height: 10),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10), // add padding to the left side
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                    color: Color(0xFF66FFFF),
                    borderRadius: BorderRadius.circular(10), // make the border circular
                  ),
                  child: Text(
                    "Citizen Safety Services",
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
            height: 350,
            width: MediaQuery.of(context).size.width - 20,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xFF66FFFF), // Change this to the color you want
                width: 1, // Change this to the width you want
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),

            child: GridView.count(
              crossAxisCount: 2,
              children: [
                Column(
                  children: [
                    SizedBox(height: 40),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset('images/report.png', scale: 6.0),
                    ),
                    SizedBox(height: 10), // add some space between the image and the text
                    Center(
                      child: Text('Report Offence'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 40),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset('images/police station.png', scale: 6.0),
                    ),
                    SizedBox(height: 10), // add some space between the image and the text
                    Center(
                      child: Text('Find police Station'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 40),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset('images/hospital.png', scale: 6.0),
                    ),
                    SizedBox(height: 10), // add some space between the image and the text
                    Center(
                      child: Text('Find Hospital'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10), // add padding to the left side
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                    color: Color(0xFFCC99FF),
                    borderRadius: BorderRadius.circular(10), // make the border circular
                  ),
                  child: Text(
                    "Report To Us",
                    style: GoogleFonts.laila(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF990099),
                    ),
                  ),
                ),

              ),
            ],
          ),
          // 10 logical pixels of space
          Container(
            height: 350,
            width: MediaQuery.of(context).size.width - 20,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xFFCC99FF), // Change this to the color you want
                width: 1, // Change this to the width you want
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),

            child: GridView.count(
              crossAxisCount: 2,
              children: [
                Column(
                  children: [
                    SizedBox(height: 40),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset('images/img.png', scale: 6.0),
                    ),
                    SizedBox(height: 10), // add some space between the image and the text
                    Center(
                      child: Text('Report Offence'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 40),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset('images/hacking.png', scale: 6.0),
                    ),
                    SizedBox(height: 10), // add some space between the image and the text
                    Center(
                      child: Text('Report Cyber fraud'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 40),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset('images/suspect.png', scale: 6.0),
                    ),
                    SizedBox(height: 10), // add some space between the image and the text
                    Center(
                      child: Text('Share information Anonymously'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10), // add padding to the left side
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                    color: Color(0xFF99FFCC),
                    borderRadius: BorderRadius.circular(10), // make the border circular
                  ),
                  child: Text(
                    "Information Services",
                    style: GoogleFonts.laila(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF009900),
                    ),
                  ),
                ),

              ),
            ],
          ),
          // 10 logical pixels of space
          Container(
            height: 350,
            width: MediaQuery.of(context).size.width - 20,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xFF99FFCC), // Change this to the color you want
                width: 1, // Change this to the width you want
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),

            child: GridView.count(
              crossAxisCount: 2,
              children: [
                Column(
                  children: [
                    SizedBox(height: 40),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset('images/img.png', scale: 6.0),
                    ),
                    SizedBox(height: 10), // add some space between the image and the text
                    Center(
                      child: Text('Self Defence Videos'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 40),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset('images/hacking.png', scale: 6.0),
                    ),
                    SizedBox(height: 10), // add some space between the image and the text
                    Center(
                      child: Text('Cyber Crime Information'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 40),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset('images/internet tips.png', scale: 6.0),
                    ),
                    SizedBox(height: 10), // add some space between the image and the text
                    Center(
                      child: Text('Internet Tips'),
                    ),
                  ],
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