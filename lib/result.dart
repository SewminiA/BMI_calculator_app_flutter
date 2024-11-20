import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final bool male;
  final int height;
  final int weight;
  final int age;
  final String result;

  const Result({
    super.key,
    required this.male,
    required this.height,
    required this.weight,
    required this.age,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Result", style: TextStyle(fontSize: 24)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 4,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Gender card
              InfoCard(
                label: "Gender",
                value: male ? "Male" : "Female",
                icon: male ? Icons.male : Icons.female,
                color: Colors.blue,
              ),
              const SizedBox(height: 20),

              // Age card
              InfoCard(
                label: "Age",
                value: age.toString(),
                icon: Icons.cake,
                color: Colors.deepPurple,
              ),
              const SizedBox(height: 20),

              // Result card
              InfoCard(
                label: "BMI Result",
                value: result,
                icon: Icons.insights,
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const InfoCard({super.key, 
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: color.withOpacity(0.1),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 26,
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
