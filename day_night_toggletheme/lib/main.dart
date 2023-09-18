import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

void main() {
  runApp(const ToggleTheme());
}

class ToggleTheme extends StatefulWidget {
  const ToggleTheme({super.key});

  @override
  State<ToggleTheme> createState() => _ToggleThemeState();
}

class _ToggleThemeState extends State<ToggleTheme> {
  bool isSwitched = false;
  bool lightClicked = false;
  int lblIndex = 1;
  int counter = 1;
  bool switchClicked = false;
  String lighting = "Light?";
  int currentIndex = 0;
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: switchClicked ? Colors.white : Colors.black87,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Theme Converter",
            style:
                TextStyle(color: switchClicked ? Colors.black : Colors.white),
          ),
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: switchClicked ? Colors.lightBlueAccent : Colors.black54,
          child: centerContainer(),
        ),
      ),
    );
  }

  Container centerContainer() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 70,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 8, 25, 8),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LightDarkTheme(
                        currentIndex: currentIndex, isSelected: isSelected),
                    switchPlacement()
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 70,
          )
        ],
      ),
    );
  }

  Expanded switchPlacement() {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          color: Colors.black87,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "You want it $lighting",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              "Use the switch!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            ToggleSwitch(
              minWidth: 90.0,
              cornerRadius: 20.0,
              activeBgColors: const [
                [Colors.white],
                [Colors.black54]
              ],
              activeFgColor: lightClicked ? Colors.black : Colors.white,
              inactiveBgColor: Colors.grey,
              inactiveFgColor: Colors.white,
              initialLabelIndex: lblIndex,
              totalSwitches: 2,
              labels: ['Light', 'Dark'],
              radiusStyle: true,
              onToggle: (index) {
                setState(
                  () {
                    lightClicked = true;
                    lblIndex = 0;
                    switchClicked = true;
                    counter++;
                    lighting = "Dark?";
                    currentIndex = 0;
                    isSelected = true;
                    if (counter == 2) {
                      lblIndex = 1;
                      counter = 0;
                      lightClicked = false;
                      switchClicked = false;
                      lighting = "Light?";
                      currentIndex = 1;
                      isSelected = false;
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class LightDarkTheme extends StatelessWidget {
  const LightDarkTheme({
    super.key,
    required this.currentIndex,
    required this.isSelected,
  });

  final int currentIndex;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IndexedStack(
        index: currentIndex,
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                //color: Colors.yellow.shade100,
                image: DecorationImage(
                  image: AssetImage('images/sky.jpg'),
                  fit: BoxFit.cover,
                )),
            child: AnimatedContainer(
              alignment:
                  isSelected ? Alignment.centerLeft : Alignment.centerRight,
              duration: const Duration(seconds: 2), // Animation duration
              curve: Curves.fastOutSlowIn,
              child: Image.asset('images/sun.png'),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.black12,
                image: DecorationImage(
                  image: AssetImage('images/Galaxy12.jpg'),
                  fit: BoxFit.cover,
                )),
            child: AnimatedContainer(
              alignment:
                  isSelected ? Alignment.centerLeft : Alignment.centerRight,
              duration: const Duration(seconds: 2), // Animation duration
              curve: Curves.fastOutSlowIn,
              child: Image.asset('images/moon.png'),
            ),
          ),
        ],
      ),
    );
  }
}
