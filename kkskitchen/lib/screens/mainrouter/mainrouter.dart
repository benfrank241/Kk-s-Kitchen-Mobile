import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../drawer_screens/tips.dart';
import '../menu/dinner.dart';

class MainRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBarTheme: AppBarTheme(
          color: const Color.fromARGB(255, 50, 50, 50),
        ),
      ),
      home: Center(
        child: Skeleton(),
      ),
    );
  }
}

class Skeleton extends StatefulWidget {
  Skeleton({Key? key}) : super(key: key);

  @override
  State<Skeleton> createState() => _SkeletonState();
}

int currentIndexMenus = 0;

String? dropdownValue = 'Dinner';

class _SkeletonState extends State<Skeleton> {
  final menus = [
    Dinner(),
    //dessert(),
    //snack(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DropdownButton<String>(
          alignment: Alignment.center,
          value: dropdownValue,
          icon:
              const Icon(Icons.arrow_drop_down, color: Colors.white, size: 40),
          elevation: 8,
          style: const TextStyle(color: Colors.black, fontSize: 18),
          underline: Container(
            height: 0,
          ),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <String>['Dinner', 'Desserts', 'Snacks', 'Breakfast']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 184, 145, 227),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.wechat),
            iconSize: 40,
          ),
        ],
      ),
      body: IndexedStack(
        index: currentIndexMenus,
        children: menus,
      ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 133, 255, 255),
        child: ListView(
          padding: EdgeInsets.only(top: 60),
          children: [
            const SizedBox(
              height: 130,
              child: DrawerHeader(
                child: Text(''),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Spatula.png'),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            Divider(
              height: 5,
              thickness: 5,
              color: Color.fromARGB(255, 184, 145, 227),
            ),
            ListTile(
              title: const Text('Give Tips',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  )),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Tips()));
              },
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: Color.fromARGB(200, 96, 94, 92),
            ),
            ListTile(
              title: const Text('About Kk\'s Kitchen',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  )),
              onTap: () {
                Fluttertoast.showToast(msg: 'To be implemented');
              },
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: Color.fromARGB(200, 96, 94, 92),
            ),
            ListTile(
              title: const Text('About the App',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  )),
              onTap: () {
                Fluttertoast.showToast(msg: 'To be implemented');
              },
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: Color.fromARGB(200, 96, 94, 92),
            ),
            ListTile(
              title: const Text('Admin',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  )),
              onTap: () {
                Fluttertoast.showToast(msg: 'To be implemented');
              },
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: Color.fromARGB(200, 96, 94, 92),
            ),
          ],
        ),
      ),
    );
  }
}

// String category() {
//   if (currentIndexMenus == 0) return "Dinner";
//   if (currentIndexMenus == 1) return "Dessert";
//   if (currentIndexMenus == 2) return "Snack";
//   return "test";
// }
