import 'package:flutter/material.dart';

class HealthAiCard extends StatelessWidget {
  final String title;
  final String assetImage;
  final String status;
  final Color statusColor;
  final double healthPercent;
  final VoidCallback? onTap; // Add this callback

  const HealthAiCard({
    Key? key,
    required this.title,
    required this.assetImage,
    required this.status,
    required this.statusColor,
    required this.healthPercent,
    this.onTap, // Make it optional
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      clipBehavior: Clip.antiAlias, // Ensures InkWell ripple stays within card bounds
      child: InkWell(
        onTap: onTap, // Use the passed-in onTap function
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(
                  child: Image.asset(
                    assetImage,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(status, style: TextStyle(color: statusColor, fontWeight: FontWeight.w500)),
                  const Spacer(),
                  Text('${(healthPercent * 100).toInt()}%', style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 4),
              LinearProgressIndicator(
                value: healthPercent,
                backgroundColor: Colors.grey[300],
                color: statusColor,
                minHeight: 6,
                borderRadius: BorderRadius.circular(3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}