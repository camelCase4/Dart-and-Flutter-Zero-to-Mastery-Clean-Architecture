import 'package:clean_architecture_project/data/apiClient.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(NumberFactPage());
}

class NumberFactPage extends StatefulWidget {
  const NumberFactPage({super.key});

  @override
  State<NumberFactPage> createState() => _NumberFactPageState();
}

class _NumberFactPageState extends State<NumberFactPage> {
  String textHolder = "This is a test number fact!";
  String textHolderDisplay = "";
  ApiBridge ab = ApiBridge();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Number Facts!"),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textHolderDisplay,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                onChanged: (value) {
                  textHolder = value;
                },
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () async{
                        if (textHolder != '') {
                          textHolder = await ab.numberFact(int.parse(textHolder));
                          setState(() {
                           textHolderDisplay = textHolder;
                          });
                        }
                      },
                      child: const Text("Search!")),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () async{
                        textHolder = await ab.numberFactRandom();
                        setState(() {
                          textHolderDisplay = textHolder;
                        });
                      }, child: const Text("Random Number")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
