import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherforecast/views/setting_screen.dart';

import 'add_city_screen.dart';

class HomeSidebar extends StatelessWidget {
  const HomeSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF3773F5), Color(0xFF5A94F2)], // Màu xanh gradient
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50), // Khoảng cách phía trên
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Vị trí hiện tại",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.white70,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.white, size: 20),
                      SizedBox(width: 8),
                      Text(
                        "Berlin, Germany",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 60),
                  ListTile(
                    leading: Icon(Icons.add_location_alt, color: Colors.white60),
                    title: Text("Thêm vị trí", style: TextStyle(color: Colors.white),),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddCityScreen()),
                      );
                    },
                  ),

                  SizedBox(height: 16),
                  _locationItem("Berlin, Germany"),
                  _locationItem("Liverpool, UK"),
                  _locationItem("Washington, USA"),
                ],
              ),
            ),
            Spacer(), // Đẩy các mục cài đặt xuống dưới
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.settings, color: Colors.white),
                    title: Text("Settings", style: TextStyle(color: Colors.white),),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SettingsScreen()),
                      );
                    },
                  ),

                  _menuItem(Icons.share, "Share this app"),
                  _menuItem(Icons.star, "Rate this app"),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _locationItem(String location) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(Icons.location_on, color: Colors.white70, size: 18),
          SizedBox(width: 16),
          Text(
            location,
            style: GoogleFonts.poppins(fontSize: 15, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _menuItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.white70, size: 18),
          SizedBox(width: 8),
          Text(
            title,
            style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
