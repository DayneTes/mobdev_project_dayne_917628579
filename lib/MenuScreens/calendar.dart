import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class Calendar extends StatelessWidget {
 const Calendar({super.key});

 @override
 Widget build(BuildContext context) {
  
   return Scaffold(
    appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryFixedDim,
        title: const Text('Calendar'),
        actions: const [
          SignOutButton(),
        ],
      ),


    body: TableCalendar(
      firstDay: DateTime.utc(2023, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: DateTime.now(),
  )
    
   );
     
 }
}