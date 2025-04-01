import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import 'package:weatherforecast/views/home_screen/widgets/forecast_section.dart';
import 'package:weatherforecast/views/home_screen/widgets/new_section.dart';
import 'package:weatherforecast/views/home_screen/widgets/weather_card.dart';

import '../../viewmodels/weather_view_model.dart';
import '../../widgets/forecast_item.dart';
import '../home_sidebar.dart';

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
          style: GoogleFonts.poppins(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) {
                return Stack(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      behavior: HitTestBehavior.opaque,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        transform: Matrix4.translationValues(0, 0, 0),
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.66,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(20)),
                        ),
                        child: HomeSidebar(),
                      ),
                    ),
                  ],
                );
              },
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
            WeatherCard(),
            SizedBox(height: 16),
            Text("Tin tức", style: GoogleFonts.poppins(
                fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            NewSection(),
            SizedBox(height: 16),
            Text("Dự báo", style: GoogleFonts.poppins(
                fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            ForecastSection(),
          ],
        ),
      ),
    );
  }
}



