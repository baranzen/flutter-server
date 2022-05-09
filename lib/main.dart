import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  child: const Text('bas'),
                  onPressed: () async {
                    var api = await http.post(Uri.parse(
                        'http://127.0.0.1:4000/addTask?fiyat=666w&marka=gucci'));
                  },
                ),
                TextButton(
                  onPressed: () async {
                    var api = await http
                        .post(Uri.parse('http://127.0.0.1:4000/delete'));
                  },
                  child: const Text('verileri sil'),
                ),
                TextButton(
                  onPressed: () async {
                    var response = await http.get(
                      Uri.parse('http://127.0.0.1:4000/'),
                    );
                    print(response.body);
                  },
                  child: const Text('getir'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
