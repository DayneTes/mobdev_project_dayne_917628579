import 'package:dt917628579_a1_f24/Battery/batteryindicator.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

class Emergency extends StatelessWidget {
  const Emergency({super.key});

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

            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: SizedBox(
                width: double.infinity,
                height: 320,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                  onPressed: null,
                  child: const Text('Medical Emergency',
            style: TextStyle(
              fontSize: 30
            ),),
                ),
              ),
            ),
            
            SizedBox(
              width: double.infinity,
              height: 320,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
                onPressed: null,
                child: const Text('Family Contact',
            style: TextStyle(
              fontSize: 30
            ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
