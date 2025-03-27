import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isCelsius = true;
  bool isMiles = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Units", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

            // Weather Unit Toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Weather"),
                ToggleButtons(
                  borderRadius: BorderRadius.circular(10),
                  selectedColor: Colors.white,
                  fillColor: Colors.blue,
                  color: Colors.black,
                  children: [
                    Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Text("C")),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Text("F")),
                  ],
                  isSelected: [isCelsius, !isCelsius],
                  onPressed: (index) {
                    setState(() {
                      isCelsius = (index == 0);
                    });
                  },
                ),
              ],
            ),

            SizedBox(height: 10),

            // Wind Unit Toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Wind"),
                ToggleButtons(
                  borderRadius: BorderRadius.circular(10),
                  selectedColor: Colors.white,
                  fillColor: Colors.blue,
                  color: Colors.black,
                  children: [
                    Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Text("Mil")),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Text("Km")),
                  ],
                  isSelected: [isMiles, !isMiles],
                  onPressed: (index) {
                    setState(() {
                      isMiles = (index == 0);
                    });
                  },
                ),
              ],
            ),

            SizedBox(height: 20),

            // Apps Section
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 3,
              child: Column(
                children: [
                  ListTile(
                    title: Text("Apps", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.cloud),
                    title: Text("WeatherPro"),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.info),
                    title: Text("About Weather app"),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.share),
                    title: Text("Share"),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.group),
                    title: Text("Join with us"),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.data_usage),
                    title: Text("Mobile data limit"),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {},
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Review Section
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 3,
              child: Column(
                children: [
                  ListTile(
                    title: Text("Review", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.feedback),
                    title: Text("Feedback"),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
