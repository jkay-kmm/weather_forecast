import 'package:flutter/material.dart';

class AddCityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add City"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Quay lại màn trước
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Ô nhập tìm kiếm
            TextField(
              decoration: InputDecoration(
                hintText: "Enter cities",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Danh sách các thành phố (Giả lập)
            Expanded(
              child: ListView(
                children: List.generate(4, (index) {
                  return ListTile(
                    leading: Icon(Icons.location_on, color: Colors.blue),
                    title: Text("Kreuzberg"),
                    subtitle: Text("Berlin, Germany"),
                    trailing: Icon(
                      index % 2 == 0 ? Icons.wb_sunny : Icons.cloud, // Hiển thị icon mặt trời/mây
                      color: Colors.orange,
                    ),
                    onTap: () {
                      // Xử lý khi chọn thành phố
                      print("Selected: Kreuzberg");
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
