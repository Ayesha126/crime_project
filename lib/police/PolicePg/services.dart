import 'package:crime_track_master/citizen/editprofile.dart';
import 'package:crime_track_master/police/PolicePg/FIR_Registration.dart';
import 'package:crime_track_master/police/PolicePg/protocolPage.dart';
import 'package:crime_track_master/police/PolicePg/wantedisplay.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:crime_track_master/police/PolicePg/staffDisplay.dart';
import 'package:crime_track_master/police/widgetsPolice/titlebar.dart';
import '../widgetsPolice/passwordbtn.dart';
import 'archvFiles.dart';
import 'caseDisplay.dart';
import 'checklist.dart';
import 'complaintPage.dart';
import 'homepage.dart';
class ServicesPage extends StatefulWidget {
  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  final TextEditingController _searchController = TextEditingController();
  List<ServiceItem> services = [
    ServiceItem('FIR Registration', 'images/fir.png', FIRRegistrationPage()),
  ServiceItem('Staff Details', 'images/police.png',
  StaffDisplayPage(staffDetails: [ ],)),
    ServiceItem('Case Registration', 'images/case.png', CaseDisplayPage()),
    ServiceItem('Wanted List', 'images/wanted.png', WantedDisplayPage()),
    ServiceItem('Crime Scene Checklist', 'images/list1.png', CrimeSceneChecklistPage()),
    ServiceItem('Archive Files', 'images/archive.png', ArchiveFilesPage()),
    ServiceItem('Crime Scene Protocols', 'images/app.png', ProtocolPage()), // Add this line to services list
    ServiceItem('Complaints', 'images/comp.png', ComplaintPage()),// Add this line to services list

  ];
  List<ServiceItem> filteredServices = [];

  @override
  void initState() {
    super.initState();
    filteredServices.addAll(services);
  }

  void filterServices(String query) {
    setState(() {
      filteredServices.clear();
      if (query.isNotEmpty) {
        for (ServiceItem service in services) {
          if (service.name.toLowerCase().contains(query.toLowerCase())) {
            filteredServices.add(service);
          }
        }
      } else {
        filteredServices.addAll(services);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTitleBar(title: 'Services'),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10.0, vertical: 8.0),
              child: TextField(
                controller: _searchController,
                onChanged: filterServices,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search for services...',
                  prefixIcon: const Icon(Icons.search),
                  contentPadding: const EdgeInsets.only(
                      left: 16.0, top: 8.0, bottom: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xFFFF2400), width: 1.5),
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xFFFF2400), width: 1.5),
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            filteredServices.isEmpty
                ? Center(child: Text('No services found'))
                : buildServiceRows(),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget buildServiceRows() {
    BoxDecoration boxDecoration = BoxDecoration(
      border: Border.all(
        color: Color(0xFFFF2400), // Adjust border color as needed
        width: 1.5, // Adjust border width as needed
      ),
      borderRadius: BorderRadius.circular(24.0), // Adjust border radius as needed
    );

    if (filteredServices.length == 1) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: ServiceTile(service: filteredServices[0])),
      );
    } else {
      List<Widget> rows = [];
      List<ServiceItem> remainingServices = List.from(filteredServices);

      while (remainingServices.isNotEmpty) {
        List<Widget> rowChildren = [];
        for (int i = 0; i < 2 && remainingServices.isNotEmpty; i++) {
          rowChildren.add(ServiceTile(service: remainingServices.removeAt(0)));
        }
        rows.add(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: rowChildren,
            ),
          ),
        );
        rows.add(SizedBox(height: 10));
      }
      if (rows.length % 2 == 1) {
        rows.add(SizedBox(height: 10)); // Add extra spacing for odd number of rows
      }
      return Padding(
        padding: const EdgeInsets.only(left: 10.0, bottom: 8.0, right: 10.0, top: 8.0), // Adjust padding as needed
        child: Container(
            decoration: boxDecoration, // Apply border decoration to the container
            child: Column(
            children: rows,
        ),

        ),
      );
    }
  }
}
class ServiceTile extends StatelessWidget {
  final ServiceItem service;

  ServiceTile({required this.service});

  @override
  Widget build(BuildContext context) {
    double iconHeight = 75; // Default icon height
    // Adjust icon height based on service name
    if (service.name == 'Crime Scene Protocols') {
      iconHeight = 85; // Increase the size for Crime Scene Protocols
    }

    return GestureDetector(
      onTap: () {
        if (service.name == 'Staff Details') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailsButton(onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => StaffDisplayPage(staffDetails: []),
                ),
              );
            })),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => service.page),
          );
        }
      },
      child: Column(
        children: [
          Image.asset(
            service.iconPath,
            height: iconHeight,
          ),
          SizedBox(height: 5),
          Text(
            service.name,
            style: GoogleFonts.merriweather(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceItem {
  final String name;
  final String iconPath;
  final Widget page;

  ServiceItem(this.name, this.iconPath, this.page);
}
