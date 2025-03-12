import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Map<String, dynamic>> _trackingSteps = [
    {'title': 'Order Placed', 'isCompleted': true},
    {'title': 'Order Confirmed', 'isCompleted': true},
    {'title': 'Shipped', 'isCompleted': false},
    {'title': 'Out for Delivery', 'isCompleted': false},
    {'title': 'Delivered', 'isCompleted': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order Tracking')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order Status',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ..._trackingSteps.map((step) => _buildTrackingStep(step)),
          ],
        ),
      ),
    );
  }

  Widget _buildTrackingStep(Map<String, dynamic> step) {
    return Row(
      children: [
        Icon(
          step['isCompleted']
              ? Icons.check_circle
              : Icons.radio_button_unchecked,
          color: step['isCompleted'] ? Colors.green : Colors.grey,
        ),
        const SizedBox(width: 10),
        Text(
          step['title'],
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: step['isCompleted'] ? Colors.green : Colors.black54,
          ),
        ),
      ],
    );
  }
}
