import 'package:flutter/material.dart';

class AddCityScreen extends StatefulWidget {
  @override
  _AddCityScreenState createState() => _AddCityScreenState();
}

class _AddCityScreenState extends State<AddCityScreen> {
  TextEditingController _controller = TextEditingController();
  List<String> cities = ["Kreuzberg", "Berlin", "Paris", "London"];
  List<String> filteredCities = [];

  @override
  void initState() {
    super.initState();
    filteredCities = cities; // Mặc định hiển thị tất cả các thành phố
  }

  // Hàm tìm kiếm thành phố khi người dùng nhập vào TextField
  void _searchCity(String query) {
    setState(() {
      filteredCities = cities
          .where((city) => city.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thêm thành phố"),
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
            // Ô nhập tìm kiếm bọc trong Container với BoxDecoration
            Container(
              decoration: BoxDecoration(
                color: Colors.white, // Màu nền của ô tìm kiếm
                borderRadius: BorderRadius.circular(30.0), // Bo góc
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 6,
                    offset: Offset(0, 4), // Độ dời bóng
                  ),
                ],
              ),
              child: TextField(
                controller: _controller,
                onChanged: _searchCity, // Gọi hàm tìm kiếm khi người dùng nhập
                decoration: InputDecoration(
                  hintText: "Tìm kiếm thành phố",
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none, // Không có viền
                  contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0), // Padding bên trong
                ),
              ),
            ),
            SizedBox(height: 16),

            // Danh sách các thành phố bọc trong Container với BoxDecoration
            Expanded(
              child: ListView.builder(
                itemCount: filteredCities.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 8), // Khoảng cách giữa các mục
                    decoration: BoxDecoration(
                      color: Colors.white, // Màu nền của Container
                      borderRadius: BorderRadius.circular(12), // Bo góc
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 6,
                          offset: Offset(0, 4), // Độ dời bóng
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: Icon(Icons.location_on, color: Colors.blue),
                      title: Text(filteredCities[index]),
                      subtitle: Text("Vị trí chưa rõ"),
                      trailing: Icon(
                        index % 2 == 0 ? Icons.wb_sunny : Icons.cloud, // Hiển thị icon mặt trời/mây
                        color: Colors.orange,
                      ),
                      onTap: () {
                        // Xử lý khi chọn thành phố
                        print("Selected: ${filteredCities[index]}");
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
