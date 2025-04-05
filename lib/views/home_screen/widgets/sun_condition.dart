import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SunCondition extends StatelessWidget {
  const SunCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Conditions", style: TextStyle(color: Colors.grey)),
              Text("UV index", style: TextStyle(color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Sun",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "0.3",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Stack(
            alignment: Alignment.center,
            children: [
              const Divider(thickness: 2, color: Colors.blueGrey),
              Positioned(
                child: Column(
                  children: [
                    Icon(
                      LucideIcons.sun,
                      color: Colors.orange,
                    ),
                    const SizedBox(height: 34),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("03:15 AM", style: TextStyle(color: Colors.grey)),
              Text("06:15 PM", style: TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}
