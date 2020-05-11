import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavRailExample(),
    );
  }
}

class NavRailExample extends StatefulWidget {
  @override
  _NavRailExampleState createState() => _NavRailExampleState();
}

class _NavRailExampleState extends State<NavRailExample> {
  int selectedIndex = 0;
  bool toggle = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                setState(() {
                  toggle = !toggle;
                });
              },
              child: NavigationRail(
                groupAlignment: 0,
                minWidth: 56,
                extended: toggle,
                labelType: NavigationRailLabelType.none,
                unselectedLabelTextStyle: TextStyle(
                  color: Colors.black,
                ),
                selectedLabelTextStyle: TextStyle(color: Color(0xffe8bd9b)),
                selectedIconTheme: IconThemeData(
                  color: Colors.white,
                ),
                backgroundColor: Color(0xff2c3034),
                onDestinationSelected: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text("Home"),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite),
                    label: Text("Favorite"),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.bookmark),
                    label: Text("Bookmarks"),
                  ),
                ],
                selectedIndex: selectedIndex,
              ),
            ),
            Expanded(
                child: Container(
              color: Color(0xff28282e),
              child: Center(
                child: Text("Selected index is $selectedIndex"),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
