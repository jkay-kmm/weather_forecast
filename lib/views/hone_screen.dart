import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

import '../viewmodels/weather_view_model.dart';
import '../widgets/forecast_item.dart';
import 'home_sidebar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherViewModel>(context);
    return Scaffold(

      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          weatherProvider.weather?.location.name ?? 'Loading...',
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeSidebar()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Weather Card
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Chance of rain 60%", style: GoogleFonts.poppins(color: Colors.white, fontSize: 14)),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text("Partly Cloudy", style: GoogleFonts.poppins(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
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
            ),
            SizedBox(height: 16),

            /// News Section
            Text("News", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.asset(
                      "assets/images/Rectangle 683.png",
                      width: double.infinity,
                      height: 110,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Here's what to expect from Tuesday weather forecast",
                            style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500)),
                        SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("14 minutes ago", style: GoogleFonts.poppins(color: Color(0xFFA098AE), fontSize: 12)),
                            Text("WC Channel", style: GoogleFonts.poppins(color: Color(0xFF363B64), fontSize: 12, fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            /// Forecast Section
            Text("Forecast", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Container(
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
            ),
          ],
        ),
      ),
    );
  }

  /// Small weather details icons
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
