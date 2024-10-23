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
      home: InputPage(), // Trang đầu tiên
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DisplayPage(
                          imagePath: 'images/a.jpeg', // Đường dẫn tới ảnh 1
                        ),
                      ),
                    );
                  },
                  child: const Text(""),
                ),
                const SizedBox(height: 20),
                // Nút 2: Hiển thị ảnh 2
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DisplayPage(
                          imagePath: 'images/b.jpeg', // Đường dẫn tới ảnh 2
                        ),
                      ),
                    );
                  },
                  child: const Text(""),
                ),
                const SizedBox(height: 20),
                // Nút 3: Hiển thị ảnh 3
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DisplayPage(
                          imagePath: 'images/img3.png', // Đường dẫn tới ảnh 3
                        ),
                      ),
                    );
                  },
                  child: const Text(""),
                ),
              ],
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
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color (0xFF646464), 
                
              ),
            ),
          ),
        ],
      ),
    );
  }
}
