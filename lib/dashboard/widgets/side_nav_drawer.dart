import 'package:flutter/material.dart';
import 'package:myvolki/dashboard/home_screen.dart';
import 'package:myvolki/dashboard/widgets/ai_assistant_screen.dart';
import 'package:myvolki/dashboard/widgets/parts_store_screen.dart';
import 'package:myvolki/dashboard/widgets/service_center_screen.dart';
import 'package:myvolki/dashboard/widgets/car_details_screen.dart';

class SideNavDrawer extends StatelessWidget {
  const SideNavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Color(0xFF003366)),
            child: const Text(
              'MyVolki Menu',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('My Car Status'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.car_repair),
            title: const Text('Service Center'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ServiceCenterScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Parts Store'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const PartsStoreScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.chat),
            title: const Text('AI Assistant'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AiAssistantScreen()));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.receipt_long),
            title: const Text('Car Details & Costs'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const CarDetailsScreen()));
            },
          ),
        ],
      ),
    );
  }
}
