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
              "Đây là những gì mong đợi từ dự báo thời tiết thứ ba",
              style: GoogleFonts.poppins(
                color: Color(0xFF363B64),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Độ tương phản và màu sắc được sử dụng khi thiết kế các yếu tố giao diện người dùng có thể có tác động rất lớn đến khả năng tiếp cận của chúng đối với tất cả người dùng cuối. Chỉ dựa vào sự phân biệt màu sắc giới hạn khả năng của những người mù màu sử dụng sản phẩm của bạn. Sử dụng các màu sáng và tối kết hợp với các kỹ thuật như tập trung chéo để phân biệt một phần của giao diện giúp người dùng có các vấn đề về tầm nhìn dễ tiếp cận hơn. Tâm lý thiết kế này có thể dẫn đến các giao diện thú vị và có thể sử dụng hơn cho tất cả người dùng của bạn.",
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
