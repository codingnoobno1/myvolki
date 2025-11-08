import 'package:flutter/material.dart';

class PartsStoreScreen extends StatelessWidget {
  const PartsStoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parts Store'),
        backgroundColor: const Color(0xFF003366),
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.filter_alt),
            title: Text('DSG Filter'),
            subtitle: Text('Part #0AM325433E'),
            trailing: Text('\$45.00'),
          ),
          ListTile(
            leading: Icon(Icons.local_car_wash),
            title: Text('Brake Pads (Set)'),
            subtitle: Text('Part #5Q0698151B'),
            trailing: Text('\$120.00'),
          ),
        ],
      ),
    );
  }
}