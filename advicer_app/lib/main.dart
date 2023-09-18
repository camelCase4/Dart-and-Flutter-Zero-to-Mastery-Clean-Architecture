import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const AdvicePage());
}

class AdvicePage extends StatefulWidget {
  const AdvicePage({super.key});

  @override
  State<AdvicePage> createState() => _AdvicePageState();
}

class _AdvicePageState extends State<AdvicePage> {
  String displayText = "Do you need an advice?";
  bool isLoading = false;

  void getApiData() async {
    String urlString = "https://api.adviceslip.com/advice";
    Uri uri = Uri.parse(urlString);
    http.Response rp = await http.get(uri);

    if (rp.statusCode == 200) {
      String data = rp.body;
      var decodedData = jsonDecode(data);

      String advice = decodedData['slip']['advice'];

      setState(() {
        displayText = advice;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Advicer"),
          backgroundColor: Colors.black54,
        ),
        body: Center(
          child: Container(
            width: double.infinity,
            color: Colors.black54,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  displayText,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                if (isLoading)
                  const SpinKitChasingDots(
                    color: Colors.white,
                    size: 50.0,
                  ),
                ElevatedButton(
                  onPressed: () {
                    getApiData();
                    setState(() {
                      isLoading = true;
                    });
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Need Advice?"),
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
