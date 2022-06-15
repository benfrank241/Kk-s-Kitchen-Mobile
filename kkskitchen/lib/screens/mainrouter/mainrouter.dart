import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../menu/dinner.dart';

class MainRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 50, 50, 50),
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
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
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
      drawer: Drawer(),
    );
  }
}

String category() {
  if (currentIndexMenus == 0) return "Dinner";
  if (currentIndexMenus == 1) return "Dessert";
  if (currentIndexMenus == 2) return "Snack";
  return "test";
}
