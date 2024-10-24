import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Tắt banner debug
      home: PasswordInput(), // Trang đầu tiên
    );
  }
}

class PasswordInput extends StatefulWidget {
  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  final TextEditingController _controller = TextEditingController();
  String storedPassword = 'dangcap';

  void checkPassword() {
    if (_controller.text == storedPassword) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => InputPage()),
      );
    } else {
      // Sai
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Nội dung trang
          Center( // Đưa nội dung vào giữa màn hình
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Căn giữa theo trục dọc
              children: [
                TextField(
                  controller: _controller,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Nhập gì đi',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20), // Khoảng cách giữa ô nhập và nút
                ElevatedButton(
                  onPressed: checkPassword,
                  child: Text('Gửi'),
                ),
              ],
            ),
          ),
          // Lớp phủ bán trong suốt để giảm độ sáng
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.8), // Độ tối, điều chỉnh độ mờ ở đây
            ),
          ),
        ],
      ),
    );
  }
}



class InputPage extends StatelessWidget {
  const InputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test App"),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'images/c.jpg', // Đường dẫn tới ảnh nền (tùy ý)
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Nút 1: Hiển thị ảnh 1
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DisplayPage(
                          imagePath: 'images/a.jpeg', // Đường dẫn tới ảnh 1
                        ),
                      ),
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: const Text("20"),
                ),
                const SizedBox(height: 20),
                // Nút 2: Hiển thị ảnh 2
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DisplayPage(
                          imagePath: 'images/e.jpeg', // Đường dẫn tới ảnh 2
                        ),
                      ),
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: const Text("40"),
                ),
                const SizedBox(height: 20),
                // Nút 3: Hiển thị ảnh 3
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DisplayPage(
                          imagePath: 'images/b.jpeg', // Đường dẫn tới ảnh 3
                        ),
                      ),
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: const Text("17"),
                ),
              ],
            ),
          ),
          // Lớp phủ bán trong suốt để giảm độ sáng
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.8), // Điều chỉnh độ mờ ở đây
            ),
          ),
        ],
      ),
    );
  }
}


// Trang hiển thị ảnh với đường dẫn được truyền vào
class DisplayPage extends StatelessWidget {
  final String imagePath;

  const DisplayPage({super.key, required this.imagePath});
  

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formattedTime =
        '${now.hour}:${now.minute} - ${now.day}/${now.month}/${now.year}';
    return Scaffold(
      body: Stack(
        children: [
          // Hiển thị ảnh nền
          Positioned.fill(
            child: Image.asset(
              imagePath, // Đường dẫn tới ảnh từ nút đã chọn
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 273, // Căn từ đáy màn hình 50px
            left: 148,   // Căn từ trái màn hình 20px
            child: Text(
              formattedTime, // Thời gian hiện tại
              style: const TextStyle(
                fontSize: 9,
                color: Color (0xFF646464), 
                
              ),
            ),
          ),
        ],
      ),
    );
  }
}
