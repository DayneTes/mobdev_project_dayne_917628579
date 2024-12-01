import 'package:dt917628579_a1_f24/Battery/batteryindicator.dart';
import 'package:dt917628579_a1_f24/model/meals.dart';
import 'package:dt917628579_a1_f24/service/remoteservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final User? user = auth.currentUser;

String? userEmail = user?.email;

class Lunch extends StatefulWidget {
  const Lunch({super.key});

  @override
  _LunchState createState() => _LunchState();
}

class _LunchState extends State<Lunch> {
  List<Meals>? meals;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    meals = await RemoteService().getLunch();
    if (meals != null) {
      setState(() {
        isLoaded = true;
      });
    }
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
      body: isLoaded
          ? ListView.builder(
              itemCount: meals?.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(meals![index].description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 30),
                      child: ElevatedButton(
                        onPressed: () {
                          RemoteService()
                              .orderMeal(userEmail!, 'lunch', index + 1);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Center(
                              child: Text(
                                'Lunch Combo Ordered',
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.only(
                                top: 0, left: 10, right: 10, bottom: 800),
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(200, 100),
                        ),
                        child:
                            const Text('Order', style: TextStyle(fontSize: 25)),
                      ),
                    ),
                    const Divider(),
                  ],
                );
              },
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
