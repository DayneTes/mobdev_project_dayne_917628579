import 'package:dt917628579_a1_f24/Battery/batteryindicator.dart';
import 'package:dt917628579_a1_f24/service/remoteservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final User? user = auth.currentUser;

String? userEmail = user?.email;

class Help extends StatelessWidget {
  const Help({super.key});

  Widget helpButton(String buttonText, BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: SizedBox(
              width: double.infinity,
              height: 220,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
                onPressed: () {
                  RemoteService().sendHelp(buttonText, '$userEmail');
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Center(
                      child: Text(
                        'Help Request Sent',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.only(
                        top: 0, left: 10, right: 10, bottom: 800),
                  ));
                },
                child: Text(
                  buttonText,
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
          )
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryFixedDim,
        title: BatteryIndicator(),
        actions: const [
          SignOutButton(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            helpButton('Ask to Feed', context),
            helpButton('Medicine Assistance', context),
            helpButton('Restroom Assistance', context),
          ],
        ),
      )
    );
  }
}
