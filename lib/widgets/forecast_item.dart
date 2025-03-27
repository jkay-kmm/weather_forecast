import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForecastItem extends StatelessWidget {
  final String time;
  final String iconPath;
  final String temp;

  const ForecastItem({
    Key? key,
    required this.time,
    required this.iconPath,
    required this.temp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(time, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 4),
        Image.asset(iconPath, width: 30),
        const SizedBox(height: 4),
        Text(temp, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500)),
      ],
    );
  }
}
