import 'package:dt917628579_a1_f24/Battery/batteryindicator.dart';
import 'package:dt917628579_a1_f24/Meal/breakfast.dart';
import 'package:dt917628579_a1_f24/Meal/dinner.dart';
import 'package:dt917628579_a1_f24/Meal/lunch.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

class Meal extends StatelessWidget {
  const Meal({super.key});

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
      body: 
    
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
      
          SizedBox(
            width: double.infinity,
            height: 297,
            child: ElevatedButton(
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(context,
                 MaterialPageRoute(builder: (context) => Breakfast()
                 ),
                 );
              },
              child: const Text('Breakfast',
            style: TextStyle(
              fontSize: 30
            ),),
            ),
          ),

           SizedBox(
            width: double.infinity,
            height: 297,
            child: ElevatedButton(
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(context,
                 MaterialPageRoute(builder: (context) => Lunch()
                 ),
                 );
              },
              child: const Text('Lunch',
            style: TextStyle(
              fontSize: 30
            ),),
            ),
          ),

           SizedBox(
            width: double.infinity,
            height: 297,
            child: ElevatedButton(
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(context,
                 MaterialPageRoute(builder: (context) => Dinner()
                 ),
                 );
              },
              child: const Text('Dinner',
            style: TextStyle(
              fontSize: 30
            ),),
            ),
          ),
          ]
          )
    );
  }
}