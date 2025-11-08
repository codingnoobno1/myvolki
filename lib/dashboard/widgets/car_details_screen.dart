import 'package:flutter/material.dart';

class CarDetailsScreen extends StatelessWidget {
  const CarDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Details & Costs'),
        backgroundColor: const Color(0xFF003366),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildCarInfoCard(context, 'XXX123'),
          const SizedBox(height: 16),
          _buildExpenditureCard(context),
          const SizedBox(height: 16),
          _buildServiceHistory(context),
        ],
      ),
    );
  }

  Widget _buildCarInfoCard(BuildContext context, String numberPlate) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Car Information', style: Theme.of(context).textTheme.titleLarge),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.pin, color: Color(0xFF003366)),
              title: const Text('Number Plate'),
              subtitle: Text(numberPlate, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            const ListTile(
              leading: Icon(Icons.shield, color: Color(0xFF003366)),
              title: Text('Insurance Cost (Annual)'),
              subtitle: Text('\$1,250.00', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpenditureCard(BuildContext context) {
    return Card(
      elevation: 4,
      color: const Color(0xFF003366),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'Total Expenditure on Car',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              '\$2,115.00',
              style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceHistory(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Service History', style: Theme.of(context).textTheme.titleLarge),
            const Divider(),
            const ExpansionTile(
              leading: Icon(Icons.build, color: Colors.green),
              title: Text('10,000 KM Service'),
              subtitle: Text('Date: 2024-10-15'),
              children: [
                ListTile(title: Text('Oil Change'), trailing: Text('\$120.00')),
                ListTile(title: Text('Air Filter Replacement'), trailing: Text('\$50.00')),
                ListTile(title: Text('Labor'), trailing: Text('\$150.00')),
                ListTile(title: Text('Total'), trailing: Text('\$320.00', style: TextStyle(fontWeight: FontWeight.bold))),
              ],
            ),
            const ExpansionTile(
              leading: Icon(Icons.local_car_wash, color: Colors.orange),
              title: Text('DSG Service'),
              subtitle: Text('Date: 2024-05-20'),
              children: [
                ListTile(title: Text('DSG Fluid Change'), trailing: Text('\$250.00')),
                ListTile(title: Text('DSG Filter'), trailing: Text('\$45.00')),
                ListTile(title: Text('Labor'), trailing: Text('\$250.00')),
                ListTile(title: Text('Total'), trailing: Text('\$545.00', style: TextStyle(fontWeight: FontWeight.bold))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}