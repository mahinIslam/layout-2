// Create a Grid Layout of IoT (Internet of Things) devices in a particular house.
// Keep it simple to just 4-6 devices.
// Each device will have an icon on its own.
// When you press the icon, toggle the image and toggle the text underneath between on and off.

// Modify your current app to now have tabs.
// You can implement tab by having a tabController.
// Refer to: https://flutter.dev/docs/cookbook/design/tabs
// This will give you a hint on how to implement a layout with tabs.
// The end result should look something like the image given.

import 'package:flutter/material.dart';
import 'apps.dart';
import 'app_container.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Device> devices = [
    Device("Iron Machine", Icons.iron, "common Room"),
    Device("Television", Icons.tv, "common Room"),
    Device("Computer", Icons.computer, "Bedroom"),
    Device("Desktop Computer", Icons.desktop_windows, "Bedroom"),
    Device("Digital watch", Icons.access_alarm, "common Room"),
    Device("Air Condition", Icons.ac_unit, "Bedroom"),
  ];

  late List<Device> livingRoom =
      devices.where((device) => device.category == "common Room").toList();
  late List<Device> bedRoom =
      devices.where((device) => device.category == "Bedroom").toList();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Mahin - IoT Home App"),
            bottom: const TabBar(
              tabs: [
                Tab(text: "All"),
                Tab(text: "Bedroom"),
                Tab(text: "common Room"),
              ],
            ),
          ),
          body: TabBarView(children: [
            //*** Tap 1 ***//
            Container(
              color: Colors.grey[100],
              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: GridView.count(
                childAspectRatio: (140 / 100),
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                children: devices.map((device) {
                  return DeviceContainer(device);
                }).toList(),
              ),
            ),

            //*** Tap 2 ***//
            Container(
              color: Colors.grey[100],
              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: GridView.count(
                childAspectRatio: (140 / 100),
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                children: bedRoom.map((device) {
                  return DeviceContainer(device);
                }).toList(),
              ),
            ),

            //*** Tap 3 ***//
            Container(
              color: Colors.grey[100],
              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: GridView.count(
                childAspectRatio: (140 / 100),
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                children: livingRoom.map((device) {
                  return DeviceContainer(device);
                }).toList(),
              ),
            ),
          ])),
    ));
  }
}
