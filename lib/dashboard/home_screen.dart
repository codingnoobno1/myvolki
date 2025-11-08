import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:myvolki/dashboard/widgets/fuel_status_card.dart';
import 'package:myvolki/dashboard/widgets/side_nav_drawer.dart';
import 'package:myvolki/dashboard/widgets/health_ai_card.dart';
import 'package:myvolki/dashboard/widgets/component_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Car Status'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const SideNavDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 3D Car Model Viewer
              SizedBox(
                height: 300,
                child: ModelViewer(
                  src: 'assets/carmodel/2019_volkswagen_golf_r.glb', // Use the .glb file
                  alt: "A 3D model of a car",
                  autoRotate: true,
                  cameraControls: true,
                  backgroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: 24),

              // Car Status Card
              const MyCarStatusCard(
                fuelLevel: 0.75, // Example value
                totalKm: 45210, // Example value
                lastJourneyKm: 32, // Example value
              ),
              const SizedBox(height: 16),
              // Health Cards Grid
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.0, // Make cards square for a balanced look
                children: [
                  HealthAiCard(
                    title: 'Engine',
                    assetImage: 'assets/engine.png',
                    status: 'Healthy',
                    statusColor: Colors.green,
                    healthPercent: 0.9,
                    onTap: () => _navigateToDetail(context, 'Engine'),
                  ),
                  HealthAiCard(
                    title: 'DSG',
                    assetImage: 'assets/dsg.png',
                    status: 'Check Soon',
                    statusColor: Colors.orange,
                    healthPercent: 0.65,
                    onTap: () => _navigateToDetail(context, 'DSG'),
                  ),
                  HealthAiCard(
                    title: 'Battery',
                    assetImage: 'assets/battery.png',
                    status: 'Healthy',
                    statusColor: Colors.green,
                    healthPercent: 0.85,
                    onTap: () => _navigateToDetail(context, 'Battery'),
                  ),
                  HealthAiCard(
                    title: 'Tyres',
                    assetImage: 'assets/tyres.png',
                    status: 'Healthy',
                    statusColor: Colors.green,
                    healthPercent: 0.8,
                    onTap: () => _navigateToDetail(context, 'Tyres'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToDetail(BuildContext context, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ComponentDetailScreen(componentTitle: title),
      ),
    );
  }
}