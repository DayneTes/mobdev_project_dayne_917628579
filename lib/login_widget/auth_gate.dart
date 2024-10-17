import 'package:dt917628579_a1_f24/Navigation/mainmenu.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';


class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
          providers: [
            EmailAuthProvider(),
          ],

          headerBuilder: (context, constraints, shrinkOffset) {
             return Padding(
               padding: EdgeInsets.all(20),

               child: AspectRatio(
                 aspectRatio: 0.1,

                 child: Image.asset('Untitled.png'),
               ),
             );
           },
         );
       }
         
        return const FirstRoute();
      },
    );
  }
}