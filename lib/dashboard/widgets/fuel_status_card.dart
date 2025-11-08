import 'package:flutter/material.dart';

class MyCarStatusCard extends StatelessWidget {
  final double fuelLevel; // 0.0 - 1.0
  final int totalKm;
  final int lastJourneyKm;

  const MyCarStatusCard({
    Key? key,
    required this.fuelLevel,
    required this.totalKm,
    required this.lastJourneyKm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Fuel Level
            Column(
              children: [
                Text('Fuel Level', style: TextStyle(fontWeight: FontWeight.bold)),
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: fuelLevel),
                  duration: const Duration(seconds: 1),
                  builder: (context, value, child) {
                    return SizedBox(
                      height: 60,
                      width: 60,
                      child: CircularProgressIndicator(
                        value: value,
                        color: Colors.green,
                        backgroundColor: Colors.grey[300],
                        strokeWidth: 6,
                      ),
                    );
                  },
                ),
                Text('${(fuelLevel * 100).toInt()}%'),
              ],
            ),
            // KM Info
            Column(
              children: [
                Text('Total KM', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('$totalKm km'),
              ],
            ),
            Column(
              children: [
                Text('Last Journey', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('$lastJourneyKm km'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
