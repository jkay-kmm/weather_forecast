import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home_screen/hone_screen.dart';

class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tin tức"),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
          ), // Đổi sang icon < để quay lại Home
          onPressed: () {
            // Chuyển hướng về màn hình Home
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "assets/images/Rectangle 683.png",
                width: double.infinity,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "WC Channel",
                  style: GoogleFonts.poppins(
                    color: Color(0xFF363B64),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 18),
                Text(
                  "14 minutes ago",
                  style: GoogleFonts.poppins(
                    color: Color(0xFFA098AE),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Here's what to expect from Tuesday weather forecast",
              style: GoogleFonts.poppins(
                color: Color(0xFF363B64),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "The contrast and colors employed when designing user interface elements can have a huge impact on their accessibility to all end-users. Relying solely on color distinctions limits the ability of color blind individuals to use your product. Using light and dark colors combined with techniques such as cross-hatching to differentiate part of the interface make it more accessible for users with vision issues. This design mentality can result in more interesting and usable interfaces for all of your users.",
              style: GoogleFonts.poppins(
                color: Color(0xFF363B64),
                fontSize: 16,
              ),
            ),
            SizedBox(height: 40),
            Container(
              decoration: BoxDecoration(
                color: Colors.white, // Màu nền của container
                borderRadius: BorderRadius.circular(12), // Bo góc
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 6,
                    offset: Offset(0, 4), // Độ dời bóng
                  ),
                ],
              ),
              padding: EdgeInsets.all(16), // Khoảng cách xung quanh
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tin tức thời tiết",
                    style: GoogleFonts.poppins(
                      color: Color(0xFF363B64),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 18),
                  Text(
                    "Chia sẻ ngay",
                    style: GoogleFonts.poppins(
                      color: Color(0xFFA098AE),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
