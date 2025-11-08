import 'package:flutter/material.dart';
import 'widgets/health_ai_card.dart';
import 'widgets/side_nav_drawer.dart';
import 'widgets/mycar_status_card.dart';

class HomeUI extends StatelessWidget {
  const HomeUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideNavDrawer(),
      appBar: AppBar(
        title: const Text('MyVolki Dashboard'),
        backgroundColor: const Color(0xFF003366),
        elevation: 4,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.grey.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // My Car Status
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: MyCarStatusCard(
                  fuelLevel: 0.75,
                  totalKm: 12000,
                  lastJourneyKm: 120,
                ),
              ),

              // Full Car Image in Card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  shadowColor: Colors.grey.shade400,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset(
                      'assets/car.png',
                      fit: BoxFit.contain,
                      height: 180, // Reduced from 220
                    ),
                  ),
                ),
              ),

              // Health Cards Grid (FIX: Aspect ratio adjusted to prevent overflow)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.95, // Primary fix for the 75px overflow
                  children: const [
                    HealthAiCard(
                      title: 'Engine',
                      assetImage: 'assets/engine.png',
                      status: 'Healthy',
                      statusColor: Colors.green,
                      healthPercent: 0.9,
                    ),
                    HealthAiCard(
                      title: 'DSG',
                      assetImage: 'assets/dsg.png',
                      status: 'Check Soon',
                      statusColor: Colors.orange,
                      healthPercent: 0.65,
                    ),
                    HealthAiCard(
                      title: 'Battery',
                      assetImage: 'assets/battery.png',
                      status: 'Healthy',
                      statusColor: Colors.green,
                      healthPercent: 0.85,
                    ),
                    HealthAiCard(
                      title: 'Tyres',
                      assetImage: 'assets/tyres.png',
                      status: 'Healthy',
                      statusColor: Colors.green,
                      healthPercent: 0.8,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Integrate AI assistant
        },
        backgroundColor: const Color(0xFF003366),
        child: const Icon(Icons.smart_toy),
        tooltip: 'AI Assistant',
      ),
    );
  }
}