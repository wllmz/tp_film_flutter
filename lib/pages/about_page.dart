import 'package:flutter/material.dart';
import '../widgets/drawer.dart'; // Import du CustomDrawer

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: Center(
        child: Text(
          'Voici la page about me de william',
          style: const TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      drawer: CustomDrawer(
        selectedIndex: 2,
        onItemTapped: (index) {},
      ),
    );
  }
}
