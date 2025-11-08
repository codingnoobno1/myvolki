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
            // Fuel Level Circle
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Fuel Level',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: fuelLevel),
                  duration: const Duration(seconds: 1),
                  builder: (context, value, child) {
                    return SizedBox(
                      height: 60,
                      width: 60,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          CircularProgressIndicator(
                            value: value,
                            color: value > 0.3 ? Colors.green : Colors.red,
                            backgroundColor: Colors.grey[300],
                            strokeWidth: 6,
                          ),
                          Center(
                            child: Text('${(value * 100).toInt()}%'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),

            // Total KM
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Total KM', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text('$totalKm km', style: const TextStyle(fontSize: 16)),
              ],
            ),

            // Last Journey
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Last Journey', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text('$lastJourneyKm km', style: const TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
