import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../../../models/news_model.dart';
import '../../../service/news_api_service.dart';


class NewScreen extends StatelessWidget {
  const NewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverAppBar cho phép ẩn và hiện AppBar khi cuộn
          SliverAppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              "Tin tức",
              style: GoogleFonts.poppins(
                color: Color(0xFF363B64),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            // Đảm bảo các thuộc tính này được cài đặt đúng
            floating: true,   // AppBar sẽ ẩn khi cuộn lên
            pinned: true,     // AppBar sẽ hiện lại khi cuộn xuống
            snap: true,       // Khi vuốt nhanh, AppBar sẽ hiện lên ngay lập tức
          ),
          // Body content được thay thế bằng SliverList
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return FutureBuilder<List<NewsArticle>>(
                  future: ApiService.fetchNews(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text("Lỗi: ${snapshot.error}"));
                    }
                    final newsList = snapshot.data!;

                    // Thêm một Card cho mỗi bài báo trong danh sách
                    return Column(
                      children: newsList.map((news) {
                        return Card(
                          elevation: 4,
                          margin: EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                                child: news.image.isNotEmpty
                                    ? Image.network(news.image, width: double.infinity, height: 180, fit: BoxFit.cover)
                                    : Container(
                                  color: Colors.grey.shade200,
                                  width: double.infinity,
                                  height: 180,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  news.title,
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF363B64),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                child: Text(
                                  news.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Color(0xFF363B64),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    );
                  },
                );
              },
              childCount: 1, // Chỉ cần 1 lần hiển thị trong SliverList
            ),
          ),
        ],
      ),
    );
  }
}
