import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/forecast_item.dart';

class ForecastSection extends StatelessWidget {
  const ForecastSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Partly Cloudy", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFFA098AE))),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("August, 10th 2020", style: GoogleFonts.poppins(fontSize: 16, color: Color(0xFF363B64),fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ForecastItem(time: "2 PM", iconPath: "assets/icons/image 16.png", temp: "30°C"),
              ForecastItem(time: "3 PM", iconPath: "assets/icons/image 17.png", temp: "28°C"),
              ForecastItem(time: "4 PM", iconPath: "assets/icons/image 18.png", temp: "26°C"),
            ],
          ),
        ],
      ),
    );
  }
}
