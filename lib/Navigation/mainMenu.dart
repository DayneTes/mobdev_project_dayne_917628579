import 'package:dt917628579_a1_f24/Battery/batteryindicator.dart';
import 'package:dt917628579_a1_f24/MenuScreens/Camera.dart';
import 'package:dt917628579_a1_f24/MenuScreens/Emergency.dart';
import 'package:dt917628579_a1_f24/MenuScreens/Help.dart';
import 'package:dt917628579_a1_f24/MenuScreens/Map.dart';
import 'package:dt917628579_a1_f24/MenuScreens/Meal.dart';
import 'package:dt917628579_a1_f24/MenuScreens/calendar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

class FirstRoute extends StatefulWidget {
  const FirstRoute({super.key});

  @override
  _FirstRouteState createState() => _FirstRouteState();
}

class _FirstRouteState extends State<FirstRoute> {
  String? _userEmail;

  @override
  void initState() {
    super.initState();
    _getUserInfo();
  }

  void _getUserInfo() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;

    if (user != null) {
      setState(() {
        _userEmail = user.email;
      });
    } else {
      setState(() {
        _userEmail = 'No User';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryFixedDim,
        title: Text(_userEmail ?? ''),
        actions: const [
          SignOutButton(),
          BatteryIndicator(),
        ],
      ),
      body: Container(
          padding: const EdgeInsets.all(10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              SizedBox(
                width: 190,
                height: 250,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Emergency(),
                        ),
                      );
                    },
                    child: const Text(
                      'Emergency Help',
                      style: TextStyle(fontSize: 24),
                    )),
              ),
              SizedBox(
                width: 190,
                height: 250,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Meal(),
                        ),
                      );
                    },
                    child: const Text(
                      'Request Meal',
                      style: TextStyle(fontSize: 24),
                    )),
              ),
              SizedBox(
                width: 190,
                height: 250,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CameraApp(),
                        ),
                      );
                    },
                    child: const Text(
                      'Camera',
                      style: TextStyle(fontSize: 24),
                    )),
              ),
            ]),
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              SizedBox(
                width: 190,
                height: 250,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Help(),
                        ),
                      );
                    },
                    child: const Text(
                      'Help',
                      style: TextStyle(fontSize: 24),
                    )),
              ),
              SizedBox(
                width: 190,
                height: 250,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Calendar(),
                        ),
                      );
                    },
                    child: const Text(
                      'Calendar',
                      style: TextStyle(fontSize: 24),
                    )),
              ),
              SizedBox(
                width: 190,
                height: 250,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MapApp(),
                        ),
                      );
                    },
                    child: const Text(
                      'Map',
                      style: TextStyle(fontSize: 24),
                    )),
              ),
            ]),
          ])),
    );
  }
}
