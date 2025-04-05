import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

class WeatherCard extends StatelessWidget {
  final int humidity;
  final double temperatureC;
  final String cityName;
  final String conditionText;
  final String iconUrl;
  final double windSpeed;

  const WeatherCard({
    super.key,
    required this.humidity,
    required this.temperatureC,
    required this.cityName,
    required this.conditionText,
    required this.iconUrl,
    required this.windSpeed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF7CA9FF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tỉ lệ mưa $humidity%",
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                conditionText,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
                  Image.network(iconUrl, width: 50, height: 60),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.location_on, color: Colors.white, size: 18),
              Text(
                cityName,
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$temperatureC° C",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10,),
              Flexible(
                child: Row(
                  children: [
                    _weatherIcon(Icons.water_drop, "10%"),
                    _weatherIcon(Icons.wb_sunny, "0.5"),
                    _weatherIcon(Icons.wind_power, "$windSpeed mph"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _weatherIcon(IconData icon, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.white, size: 16),
        SizedBox(width: 4),
        Text(
          value,
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
        ),
        SizedBox(width: 12),
      ],
    );
  }
}
