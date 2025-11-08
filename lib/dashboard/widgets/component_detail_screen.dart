import 'package:flutter/material.dart';

class ComponentDetailScreen extends StatelessWidget {
  final String componentTitle;

  const ComponentDetailScreen({
    Key? key,
    required this.componentTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$componentTitle Details'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Text('Detailed sensor data for $componentTitle will be displayed here.'),
      ),
    );
  }
}