import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  final _auth = FirebaseAuth.instance;

  HomePage({super.key});

  void logout(BuildContext context) async {
    await _auth.signOut();
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    final user = _auth.currentUser;

    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome, ${user?.email ?? 'Guest'}"),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () => logout(context), child: Text("Logout")),
          ],
        ),
      ),
    );
  }
}
