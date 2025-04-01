import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

class WeatherCardCarousel extends StatelessWidget {
  const WeatherCardCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Forecast"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 300.0,
                enlargeCenterPage: true,  // Tạo hiệu ứng phóng to
                autoPlay: true,  // Tự động chuyển động
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,  // Điều chỉnh tỷ lệ hiển thị
              ),
              items: [
                WeatherCard(),
                WeatherCard(),
                WeatherCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Tỉ lệ mưa 60%", style: GoogleFonts.poppins(color: Colors.white, fontSize: 14)),
          SizedBox(height: 8),
          Row(
            children: [
              Text("Một phần mây", style: GoogleFonts.poppins(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
              Spacer(),
              Image.asset("assets/images/image 4.png", width: 78, height: 73,),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.location_on, color: Colors.white, size: 18),
              Text("Washington DC, USA", style: GoogleFonts.poppins(color: Colors.white, fontSize: 14)),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("35° C", style: GoogleFonts.poppins(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  _weatherIcon(Icons.water_drop, "10%"),
                  _weatherIcon(Icons.wb_sunny, "0.5"),
                  _weatherIcon(Icons.wind_power, "124 mph"),
                ],
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
        Text(value, style: GoogleFonts.poppins(color: Colors.white, fontSize: 14)),
        SizedBox(width: 12),
      ],
    );
  }
}
