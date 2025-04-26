import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weatherforecast/views/home_screen/widgets/forecast_section.dart';
import 'package:weatherforecast/views/home_screen/widgets/new_section.dart';
import 'package:weatherforecast/views/home_screen/widgets/sun_condition.dart';
import 'package:weatherforecast/views/home_screen/widgets/weather_card.dart';
import 'package:weatherforecast/views/home_screen/widgets/wind.dart';

import '../../viewmodels/weather_view_model.dart';
import '../home_sidebar.dart';
import '../news/news.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    final weatherProvider = Provider.of<WeatherViewModel>(context, listen: false);
    weatherProvider.fetchWeather('Hà Nội');
    _scrollController.addListener(() {
      if (_scrollController.offset > 50 && !_isScrolled) {
        setState(() {
          _isScrolled = true;
        });
      } else if (_scrollController.offset <= 50 && _isScrolled) {
        setState(() {
          _isScrolled = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherViewModel>(context);
    final weather = weatherProvider.weather;
    final locationName = weatherProvider.weather?.cityName ?? 'Hà Nội';
    final humidity = weatherProvider.weather?.humidity ?? 0;
    final temperature = weatherProvider.weather?.temperatureC ?? 0;
    final conditionText = weatherProvider.weather?.conditionText ?? '';
    final iconUrl = weatherProvider.weather?.iconUrl ?? '';
    final windSpeed = weatherProvider.weather?.windSpeed ?? 0;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          _isScrolled ? 'Weather' : locationName,
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
                        width: MediaQuery.of(context).size.width * 0.66,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.horizontal(right: Radius.circular(20)),
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
        controller: _scrollController,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bọc WeatherCard trong SizedBox để tránh lỗi kích thước vô hạn
            SizedBox(
              height: 200,
              child: WeatherCard(
                humidity: humidity,
                temperatureC: temperature,
                cityName: locationName,
                conditionText: conditionText,
                iconUrl: iconUrl,
                windSpeed: windSpeed,
              ),
            ),
            SizedBox(height: 16),
            Text("Tin tức",
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w500)),
            SizedBox(height: 8),
            SizedBox(
              height: 200,
              child: NewScreen(),
            ),
            SizedBox(height: 16),
            Text("Dự báo",
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w500)),
            SizedBox(height: 8),
            ForecastSection(),
            SizedBox(height: 16),
            Text("Chất lượng không khí",
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w500)),
            SizedBox(height: 8),
            SunCondition(),
            SizedBox(height: 16),
            Text("Gió",
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w500)),
            SizedBox(height: 8),
            Wind(),
          ],
        ),
      ),
    );
  }

}